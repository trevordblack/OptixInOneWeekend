# TODO #

### Immediately ###
- [ ] Pull together Project 1 code
  - [ ] Part2/Section2 Cuda Mandelbrot
- [ ] add gamma somewhere in Project 3
- [ ] Update Readme 
  - [ ] Why starts at Project2
  - [ ] Now 75% done
  - [ ] Change Header picture

### Highest Priority ###
- [ ] Write Project 1 text
- [ ] Project 4 code
  - [ ] Port existing code in
  - [ ] Instancing
    - Optix has a Transform object (with geometryGroup child variable)
      - Not sure if it can also be used for motion blurring (?)
  - [ ] Adding boxes
  - [ ] Lights
  - [ ] Write Cornell Box scene code
- [ ] Turn raygen.cu (*u*,*v*) coords into (*s*,*t*) coords
  - [x] 3/5/*
  - [ ] Everywhere else

### Medium Priority ###
- [ ] Start writing Project 2 text
- [ ] Start writing Project 3 text

### Low Priority ###
- [ ] Write Project 4 text
- [ ] fix *include "../[core|?]"* in projects
  - confirm why INCLUDE_DIRECTORIES( core ) is present
- [ ] Remove add_executable - core/introOptix.h in CMakeLists.txt
- [ ] Figure out if there is a way to try-catch optix::object exceptions 
- [ ] Turn NaNs Magenta instead of black
- [ ] Confirm Lambertian RandomOnUnitSphere looks dull
- [ ] Fix Cuda compile bug that throws a linker error when multiple projects are built

### No Priority ###
- [ ] Book2
- [ ] Book3