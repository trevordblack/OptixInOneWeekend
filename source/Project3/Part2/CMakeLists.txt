INCLUDE_DIRECTORIES( core )
INCLUDE_DIRECTORIES(.)

cuda_compile_and_embed(
  raygen_ptx_c core/raygen.cu
)

cuda_compile_and_embed(
  miss_ptx_c core/miss.cu
)

cuda_compile_and_embed(
  sphere_ptx_c geometry/sphere.cu
)

cuda_compile_and_embed(
  material_ptx_c materials/material.cu
)

add_executable(IntroOptix_3_2
  core/introOptix.h
  core/introOptix.cpp
  main.cpp
  # Compiled cuda ptx programs
  ${raygen_ptx_c}
  ${miss_ptx_c}
  ${sphere_ptx_c}
  ${material_ptx_c}
)

target_link_libraries(IntroOptix_3_2
  ${optix_LIBRARY}
)

