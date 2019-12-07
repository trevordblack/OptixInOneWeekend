#include <iostream>
#include <math.h>

// Kernel function to color the buffer according to the gradient
__global__ void insideCircle(bool *buffer)
{
    int nx = blockDim.x;
    int ny = gridDim.x;

    float r = 1.0f;
    float dx = 2.0f / nx;
    float dy = 2.0f / ny;

    float x = (threadIdx.x - nx/2.0f + 0.5f) * dx;
    float y = (blockIdx.x - ny/2.0f + 0.5f) * dy;

    buffer[blockIdx.x*blockDim.x + threadIdx.x] = (x*x + y*y) < r*r;
}

int main(void)
{
    int nx = 1024;
    int ny = 1024;
    bool *buffer;

    // Allocate Unified Memory – accessible from CPU or GPU
    cudaMallocManaged(&buffer, nx*ny*sizeof(bool));

    // Run kernel on nx*ny elements on the GPU
    insideCircle<<<ny, nx>>>(buffer);

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    // Print the buffer out to command
    float sum = 0.0f;
    std::cout << "P3\n" << nx << " " << ny << "\n255\n";
    for (int j = ny-1; j >= 0; j--)
        for (int i = 0; i < nx; i++)
        {
            int index = j*nx + i;
            if(buffer[index])
            {
                std::cout << "255 255 0\n";
                sum++;
            }
            else
                std::cout << "0 0 255\n";
        }

    std::cout << "Pi is approximately " << sum * (4.0f/(nx*ny)) << std::endl;

    // Free memory
    cudaFree(buffer);
  
    return 0;
}
