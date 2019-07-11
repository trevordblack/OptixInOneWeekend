INCLUDE_DIRECTORIES(.)

cuda_compile_and_embed(
  raygen_ptx_c raygen.cu
)

cuda_compile_and_embed(
  miss_ptx_c miss.cu
)

add_executable(IntroOptix_2_2_2
  main.cpp
  # Compiled cuda ptx programs
  ${raygen_ptx_c}
  ${miss_ptx_c}
)

target_link_libraries(IntroOptix_2_2_2
  ${optix_LIBRARY}
)

