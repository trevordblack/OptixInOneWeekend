INCLUDE_DIRECTORIES(.)

cuda_compile_and_embed(
  drawColorGradient_ptx_c drawColorGradient.cu
)

add_executable(IntroOptix_2_2_1
  main.cpp
  # Compiled cuda ptx programs
  ${drawColorGradient_ptx_c}
)

target_link_libraries(IntroOptix_2_2_1
  ${optix_LIBRARY}
)

