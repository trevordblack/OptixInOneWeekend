# TODO #

### Immediately ###
- [x] Write 3_2 code
- [ ] write 3_3 code
  - [ ] 3_3_1
    - [x] create Wrapper classes
    - [x] create sphere class
    - [x] create normal material class
    - [ ] rewrite core/introOptix.cpp & core/introOptix.h
  - [ ] 3_3_2

### Highest Priority ###
- [ ] Write Project 3 code
  - [ ] Part 4
  - [ ] Part 5
  - [ ] Part 6
- [ ] Start writing Project 2 text
- [ ] Turn raygen.cu (*u*,*v*) coords into (*s*,*t*) coords
- [ ] Pull together Project 1 code

### Medium Priority ###
- [ ] Start writing Project 3 text
- [ ] Write Project 1 text
- [ ] Project 4 code
  - [ ] Port existing code in
  - [ ] Instancing
    - Optix has a Transform object (with geometryGroup child variable)
      - Not sure if it can also be used for motion blurring (?)
  - [ ] Adding boxes
  - [ ] Lights
  - [ ] Write Cornell Box scene code

### Low Priority ###
- [ ] fix *include "../[core|?]"* in projects
  - confirm why INCLUDE_DIRECTORIES( core ) is present
- [ ] Remove add_executable - core/introOptix.h in CMakeLists.txt
- [ ] Write Project 4 text
- [ ] Figure out if there is a way to try-catch optix::object exceptions 

### No Priority ###
- [ ] Book2
- [ ] Book3