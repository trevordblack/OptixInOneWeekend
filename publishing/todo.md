# TODO #

### Immediately ###
- [ ] Write Project 3 code
  - [x] Part 4
    - [x] Convert PBRT materials
    - [x] rewrite raygen.cu for Ray_Finish, seed
    - [x] Add randomInUnitSphere
    - [x] Change scene for lambertian
    - [x] Fix sky miss bug
  - [ ] Part 5
  - [ ] Part 6

### Highest Priority ###
- [ ] Pull together Project 1 code
- [ ] Write Project 1 text

### Medium Priority ###
- [ ] Start writing Project 2 text
- [ ] Start writing Project 3 text
- [ ] Turn raygen.cu (*u*,*v*) coords into (*s*,*t*) coords
- [ ] turn raydata.h into raydata.cuh
- [ ] push sphere.cu -b +- sqrt bugfix up the codebase
- [ ] Project 4 code
  - [ ] Port existing code in
  - [ ] Instancing
    - Optix has a Transform object (with geometryGroup child variable)
      - Not sure if it can also be used for motion blurring (?)
  - [ ] Adding boxes
  - [ ] Lights
  - [ ] Write Cornell Box scene code

### Low Priority ###
- [ ] Write Project 4 text
- [ ] fix *include "../[core|?]"* in projects
  - confirm why INCLUDE_DIRECTORIES( core ) is present
- [ ] Remove add_executable - core/introOptix.h in CMakeLists.txt
- [ ] Move *materials/* to *material/*
- [ ] Figure out if there is a way to try-catch optix::object exceptions 

### No Priority ###
- [ ] Book2
- [ ] Book3