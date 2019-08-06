#include <iostream>
#include <math.h>

// Kernel function to color the buffer according to the gradient
__global__ void color(float *buffer)
{
    int x = threadIdx.x;
    int y = blockIdx.x;
    int nx = blockDim.x;
    int ny = gridDim.x;
    float r = (float) x / nx;
    float g = (float) y / ny;
    float b = 0.2;
    float* triplet = buffer + 3*(blockIdx.x*blockDim.x + threadIdx.x);
    triplet[0] = r;
    triplet[1] = g;
    triplet[2] = b;
}

int main(void)
{
    int nx = 200;
    int ny = 100;
    float *buffer;

    // Allocate Unified Memory – accessible from CPU or GPU
    cudaMallocManaged(&buffer, 3*nx*ny*sizeof(float));

    // Run kernel on nx*ny elements on the GPU
    color<<<ny, nx>>>(buffer);

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
