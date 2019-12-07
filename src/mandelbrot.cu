#include <iostream>
#include <math.h>

// Kernel function to determine depth of mandelbrot at cr, ci
__device__ unsigned int mandelDepth(float cr, float ci, int maxDepth)
{
    float zr = 0.0f;
    float zi = 0.0f;
    float zrSqr = 0.0f;
    float ziSqr = 0.0f;

    unsigned int i;

    for (i = 0; i < maxDepth; i++)
    {
        zi = zr * zi;
        zi += zi + ci;
        zr = zrSqr - ziSqr + cr;
        zrSqr = zr * zr;
        ziSqr = zi * zi;

        if (zrSqr + ziSqr > 4.0f) break;
    }

    return i;
}

__device__ float3 color(unsigned int depth, unsigned int maxDepth)
{
    if(depth == maxDepth)
        return make_float3(0.0f, 0.0f, 0.0f);
    else
        return make_float3(1.0f, 1.0f, 1.0f);
}

__global__ void mandel(float* buffer, 
    float xMin, float xMax,
    float yMin, float yMax,
    unsigned int maxDepth)
{
    int nx = blockDim.x;
    int ny = gridDim.x;
    float dx = (xMax - xMin) / nx;
    float dy = (yMax - yMin) / ny;
    float x = xMin + (threadIdx.x + 0.5f) * dx;
    float y = yMin + (blockIdx.x + 0.5f) * dy;

    unsigned int depth = mandelDepth(x, y, maxDepth);
    float3 depthColor = color(depth, maxDepth);

    int index = blockIdx.x*blockDim.x + threadIdx.x;
    buffer[3*index + 0] = depthColor.x;
    buffer[3*index + 1] = depthColor.y;
    buffer[3*index + 2] = depthColor.z;
}


int main(void)
{
    float xMin = -2.0f;
    float xMax = 1.0f;
    float yMin = -1.0f;
    float yMax = 1.0f;
    float step = 0.005f; 

    int nx = (xMax - xMin) / step;
    int ny = (yMax - yMin) / step;
    float* buffer;

    // Allocate Unified Memory – accessible from CPU or GPU
    cudaMallocManaged(&buffer, 3*nx*ny*sizeof(float));

    // Run kernel on nx*ny elements on the GPU
    mandel<<<ny, nx>>>(buffer, 
        xMin, xMax,
        yMin, yMax,
        100
    );

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    // Print the buffer out to command
    std::cout << "P3\n" << nx << " " << ny << "\n255\n";
    for (int j = ny-1; j >= 0; j--)
        for (int i = 0; i < nx; i++)
        {
            float* triplet = buffer + 3*(j*nx + i);
            int ir = int(255.99f * triplet[0]);
            int ig = int(255.99f * triplet[1]);
            int ib = int(255.99f * triplet[2]);
            std::cout << ir << " " << ig << " " << ib << "\n";
        }

    // Free memory
    cudaFree(buffer);
  
    return 0;
}
