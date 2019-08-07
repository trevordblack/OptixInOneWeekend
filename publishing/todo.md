# TODO #

### Immediately ###
- [ ] Pull together Project 1 code
  - [x] Part1/Section1 Color gradient in C++
  - [x] Part1/Section2 Cuda Hello World
  - [x] Part1/Section3 Cuda Color gradient
  - [x] Part2/Section1 Estimating Pi
  - [ ] Part2/Section2 Cuda Mandelbrot
- [ ] add gamma somewhere in Project 3
- [x] push sphere.cu -b +- sqrt bugfix up the codebase
- [ ] turn random.cuh into random.h
- [ ] Turn raygen.cu (*u*,*v*) coords into (*s*,*t*) coords
- [ ] Push raydata.h into raydata.cuh fix up the codebase
- [ ] Move *materials/* to *material/*

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
- [ ] Update Readme 
  - [ ] Why starts at Project2
  - [ ] Now 75% done
  - [ ] Change Header picture

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

### No Priority ###
- [ ] Book2
- [ ] Book3