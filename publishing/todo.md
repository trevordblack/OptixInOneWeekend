# TODO #

### Immediately ###
- [ ] Write Project 3 code
  - [x] Part 4
    - [x] Section1
      - [x] Convert PBRT materials
      - [x] rewrite raygen.cu for Ray_Finish, seed
      - [x] Add randomInUnitSphere
      - [x] Change scene for lambertian
      - [x] Fix sky miss bug
    - [x] Section2
      - [x] Metal Material
      - [x] Metal scene
      - [x] debug
    - [x] Section3
      - [x] Dielectric Material
      - [x] Dielectric scene
      - [x] debug
  - [x] Part 5
    - [x] Section1
    - [ ] Section2
  - [ ] Change Lambertian to random_on_unit_square

### Highest Priority ###
- [ ] Pull together Project 1 code
- [ ] Write Project 1 text
- [ ] Turn raygen.cu (*u*,*v*) coords into (*s*,*t*) coords
- [ ] push sphere.cu -b +- sqrt bugfix up the codebase

### Medium Priority ###
- [ ] Start writing Project 2 text
- [ ] Start writing Project 3 text
- [ ] Project 4 code
  - [ ] Port existing code in
  - [ ] Instancing
    - Optix has a Transform object (with geometryGroup child variable)
      - Not sure if it can also be used for motion blurring (?)
  - [ ] Adding boxes
  - [ ] Lights
  - [ ] Write Cornell Box scene code
- [ ] turn raydata.h into raydata.cuh
- [ ] Move *materials/* to *material/*

### Low Priority ###
- [ ] Write Project 4 text
- [ ] fix *include "../[core|?]"* in projects
  - confirm why INCLUDE_DIRECTORIES( core ) is present
- [ ] Remove add_executable - core/introOptix.h in CMakeLists.txt
- [ ] Figure out if there is a way to try-catch optix::object exceptions 

### No Priority ###
- [ ] Book2
- [ ] Book3