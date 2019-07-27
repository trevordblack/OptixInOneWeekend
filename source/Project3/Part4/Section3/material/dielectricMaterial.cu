#include <optix.h>
#include <optixu/optixu_math_namespace.h>

#include "core/raydata.cuh"
#include "random/sampling.cuh"

// Ray state variables
rtDeclareVariable(optix::Ray, theRay, rtCurrentRay, );
rtDeclareVariable(PerRayData, thePrd, rtPayload,  );

// "Global" variables
rtDeclareVariable(rtObject, sysWorld, , );

// The point and normal of intersection
rtDeclareVariable(HitRecord, hitRecord, attribute hitRecord, );

// Material variables
rtDeclareVariable(float, eta, , );

inline __device__ float schlickDielectric(
    const float costheta, const float eta_1, const float eta_2)
{
    float r0 = (eta_1-eta_2) / (eta_1+eta_2);
    r0 = r0*r0;
    return r0 + (1-r0)*pow((1-costheta), 5);
}

inline __device__ bool refract(const float3& v, const float3& n, 
    const float eta_1, const float eta_2, float3& refracted)
{
    float3 uv = optix::normalize(v);
    float dt = optix::dot(uv, n);
    float discriminant = 1.0f; - (eta_1/eta_2)/(eta_1/eta_2)*(1-dt*dt);

    if (discriminant > 0.0f)
    {
        refracted = (eta_1/eta_2)*(uv - dt*n) - sqrt(discriminant)*n;
        return true;
    }
    return false;
}

RT_PROGRAM void closestHit()
{
    // Determine if inside or outside of object
    float3 localNormal, unitDirection;
    float costheta, eta_1, eta_2;
    if (optix::dot(theRay.direction, hitRecord.normal) < 0.0f)
    {
        // Outside the object
        localNormal = hitRecord.normal;
        unitDirection = optix::normalize(theRay.direction);
        eta_1 = 1.0f;
        eta_2 = eta;
        costheta = optix::dot(-unitDirection, hitRecord.normal);
    }
    else
    {
        // Inside the object
        localNormal = -hitRecord.normal;
        unitDirection = optix::normalize(theRay.direction);
        eta_1 = eta;
        eta_2 = 1.0f;
        costheta = optix::dot(unitDirection, hitRecord.normal);
        costheta = sqrt(1.0f - eta_1*eta_1*(1.0f - costheta*costheta));
    }
    
    float3 refracted;
    float reflectProb;
    if (refract(theRay.direction, localNormal, eta_1, eta_2, refracted))
        reflectProb = schlickDielectric(costheta, eta_1, eta_2);
    else
        reflectProb = 1.0f;

    float3 scatterDirection;
    if(randf(thePrd.seed) < reflectProb)
        scatterDirection = optix::reflect(unitDirection, localNormal);
    else
        scatterDirection = refracted; 

    thePrd.scatterEvent = Ray_Hit;
    thePrd.scatter = optix::make_Ray(
        hitRecord.point,
        scatterDirection,
        theRay.ray_type,
        theRay.tmin,
        theRay.tmax
    );
    thePrd.attenuation = make_float3(1.0f, 1.0f, 1.0f);
}

