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

inline __device__ float schlick(const float costheta, const float eta_2)
{
    float eta_1 = 1.0f;  // Assuming eta_1 is a vacuum
    float r0 = (eta_1-eta_2) / (eta_1+eta_2);
    r0 = r0*r0;
    return r0 + (1-r0)*pow((1-costheta), 5);
}

RT_PROGRAM void closestHit()
{
    float3 uv = optix::normalize(theRay.direction);
    float costheta = optix::dot(uv, hitRecord.normal);
    float3 localNormal;
    float dt, eta_iOverEta_t;
    // Inside the object
    if (costheta > 0.0f)
    {
       localNormal = -hitRecord.normal;
       dt = -costheta;
       eta_iOverEta_t = eta;
       costheta = eta * costheta;
    }
    // Outside the object
    else
    {
        localNormal = hitRecord.normal;
        dt = costheta;
        eta_iOverEta_t = 1.0f / eta; // assuming eta_i is a vacuum
        costheta = -costheta;
    }

    float discriminant = 1.0f - eta_iOverEta_t*eta_iOverEta_t*(1-dt*dt);
    float reflectProb;
    if (discriminant > 0.0f)
        reflectProb = schlick(costheta, eta);
    else
        reflectProb = 1.0f;

    float3 scatterDirection;
    if(randf(thePrd.seed) < reflectProb)
        scatterDirection = optix::reflect(uv, localNormal);
    else
        scatterDirection = eta_iOverEta_t*(uv-localNormal*dt)
            - localNormal*sqrt(discriminant);

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

