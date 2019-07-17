// std
#include <iostream>

// optix
#include <optix.h>
#include <optixu/optixpp.h>

// introOptix
#include "core/introOptix.h"

int main(int argc, char* argv[])
{
    IntroOptix optixSingleton = IntroOptix();
    optixSingleton.init(1200, 600);
    
    optixSingleton.createScene();

    optixSingleton.renderFrame();
    optixSingleton.printPPM();
    
    optixSingleton.destroy();
}
