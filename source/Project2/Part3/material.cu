#include <optix.h>

#include "raydata.h"

// Ray state variables
rtDeclareVariable(optix::Ray, ray, rtCurrentRay, );
rtDeclareVariable(PerRayData, prd, rtPayload,  );

// "Global" variables
rtDeclareVariable(rtObject, world, , );

RT_PROGRAM void closestHit()
{
    prd.scatterEvent = hit;
}

