#ifndef CAMERA_CUH
#define CAMERA_CUH

#include <optix.h>

rtDeclareVariable(float3, cameraOrigin, , );
rtDeclareVariable(float3, cameraU, , );
rtDeclareVariable(float3, cameraV, , );
rtDeclareVariable(float3, cameraW, , );
rtDeclareVariable(float, cameraHalfHeight, , );
rtDeclareVariable(float, cameraHalfWidth, , );
rtDeclareVariable(int, cameraType, , );


__device__ void perspectiveCamera(const float u, const float v, 
    float3& origin, float3& direction)
{
    float3 lowerLeftCorner = cameraOrigin 
        - cameraHalfWidth*cameraU - cameraHalfHeight*cameraV - cameraW;
    float3 horizontal = 2.0f*cameraHalfWidth*cameraU;
    float3 vertical = 2.0f*cameraHalfHeight*cameraV;

    origin = cameraOrigin;
    direction = lowerLeftCorner + (u*horizontal) + (v*vertical) - cameraOrigin;
}

__device__ void environmentCamera(const float u, const float v, 
    float3& origin, float3& direction)
{
    float2 d = make_float2(u*2.0f*3.14159f, v*3.14159f);
    float3 angle = make_float3(
        cos(d.x) * sin(d.y),
        -cos(d.y),
        sin(d.x) * sin(d.y)
    );

    origin = cameraOrigin;
    direction = optix::normalize(
        angle.x*cameraU + angle.y*cameraV + angle.z*cameraW
    );
}

__device__ void orthographicCamera(const float u, const float v, 
    float3& origin, float3& direction)
{
    float3 lowerLeftCorner = cameraOrigin 
        - cameraHalfWidth*cameraU - cameraHalfHeight*cameraV - cameraW;
    float3 horizontal = 2.0f*cameraHalfWidth*cameraU;
    float3 vertical = 2.0f*cameraHalfHeight*cameraV;

    origin = lowerLeftCorner + (u*horizontal) + (v*vertical) + cameraOrigin;
    direction = -optix::normalize(cameraW);
}

inline __device__ optix::Ray generateRay(float u, float v)
{
    float3 initialOrigin, initialDirection;
    if (cameraType == 0)
        perspectiveCamera(u, v, initialOrigin, initialDirection);
    else if (cameraType == 1)
        environmentCamera(u, v, initialOrigin, initialDirection);
    else if (cameraType == 2)
        orthographicCamera(u, v, initialOrigin, initialDirection);
        
    return optix::make_Ray( 
        initialOrigin,        // origin
        initialDirection,     // direction
        0,             // raytype
        0.000001f,     // tmin (epsilon)
        RT_DEFAULT_MAX // tmax
    );
}

#endif //!CAMERA_CUH
