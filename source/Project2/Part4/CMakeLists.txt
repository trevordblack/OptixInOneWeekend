INCLUDE_DIRECTORIES(.)

cuda_compile_and_embed(
  raygen_ptx_c raygen.cu
)

cuda_compile_and_embed(
  miss_ptx_c miss.cu
)

cuda_compile_and_embed(
  sphere_ptx_c sphere.cu
)

cuda_compile_and_embed(
  material_ptx_c material.cu
)

add_executable(IntroOptix_2_4
  main.cpp
  # Compiled cuda ptx programs
  ${raygen_ptx_c}
  ${miss_ptx_c}
  ${sphere_ptx_c}
  ${material_ptx_c}
)

target_link_libraries(IntroOptix_2_4
  ${optix_LIBRARY}
)

