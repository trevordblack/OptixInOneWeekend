# An Introduction to GPU RT with OptiX #

## Book 1 ##

### Readme ###
- What this book is
- Picture for end of Project 2
- Who the book is for
- Expected experience
- Tools used in this book
- Why does it start at Project2?
- Basic Table of Contents
- Repo folder organization
- Contributing
- Work left to finish
- Acknowledgements

### Project 1: Cuda ###
- Cuda Hello World
  - Cuda Linear Algebra
  - Cuda solid color
  - Cuda Color Gradient
- Cuda Mandelbrot

### Project 2: Minimal Optix Example ###
- Part 1: Optix Solid Color
  - Section 1: Explain differences cuda and optix programming
- Part 2: Blue Sky Miss Program
  - Section 1: Color Gradient
  - Section 2: Miss program
- Part 3: Adding Spheres
  - Section 1: Adding Geometry
  - Section 2: Adding a Sphere
- Part 4: Minimal Optix Example
  - Section 1: Normal Material

### Project 3: Making a Scene ###
- Part 1: Code Refactor
  - Section 1: Switching to Optix Object model
  - Section 2: Refactor code to object-oriented programming
- Part 2: Antialiasing
- Part 3: Creating our Scene classes
  - Section [1|2]: Creating an ioMaterial class
    - Lambertian Material
    - Normal Material
  - Section [1|2]: Creating geo classes
    - ioGeometryGroup
    - ioGeometryInstance
    - ioGeometry
  - Section 3: the Scene (ioScene) class
- Part 4: Adding more Materials
  - Section 1: Metal
  - Section 2: Dielectric (Thin Glass?)
  - Section 3: Maybe a 3rd other material makes sense
- Part 5: Positionable Camera
- Part 6: Making a Scene

### Project 4: Cornell Box ###
- Adding Quads
- Adding Textures
  - uv
  - solid textures
- Adding Images
  - printing out with stb
- Instancing
- Adding Boxes
- Lights
  - Turn the sky miss into an ambient light texture
  - Light class?
- Cornell Box

### Appendices ###
- THESE MAY ALL JUST BELONG IN THE BODY OF THE TEXT!!!
- CMakeLists.txt explanation
- Random Number Generators
- Differences between Acceleration Structures