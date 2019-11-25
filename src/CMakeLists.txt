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
  normal_material_ptx_c material/normalMaterial.cu
)

cuda_compile_and_embed(
  lambertian_material_ptx_c material/lambertianMaterial.cu
)

cuda_compile_and_embed(
  metal_material_ptx_c material/metalMaterial.cu
)

cuda_compile_and_embed(
  dielectric_material_ptx_c material/dielectricMaterial.cu
)

add_executable(IntroOptix_3_5_2
  core/introOptix.h
  core/introOptix.cpp
  main.cpp
  # Compiled cuda ptx programs
  ${raygen_ptx_c}
  ${miss_ptx_c}
  ${sphere_ptx_c}
  ${normal_material_ptx_c}
  ${lambertian_material_ptx_c}
  ${metal_material_ptx_c}
  ${dielectric_material_ptx_c}
)

target_link_libraries(IntroOptix_3_5_2
  ${optix_LIBRARY}
)
