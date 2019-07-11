INCLUDE_DIRECTORIES(.)

cuda_compile_and_embed(
  drawColor_ptx_c drawColor.cu
)

add_executable(IntroOptix_2_1
  main.cpp
  # Compiled cuda ptx programs
  ${drawColor_ptx_c}
)

target_link_libraries(IntroOptix_2_1
  ${optix_LIBRARY}
)

