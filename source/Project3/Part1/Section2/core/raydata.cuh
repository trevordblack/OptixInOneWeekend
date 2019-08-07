#ifndef RAY_DATA_H
#define RAY_DATA_H


typedef enum
{
    miss,
    hit
} ScatterEvent;


struct PerRayData
{
    ScatterEvent scatterEvent;
    float3 attenuation;
};


#endif //!RAY_DATA_H
