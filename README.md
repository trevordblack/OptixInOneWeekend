# An Introduction to GPU Ray Tracing with OptiX #

![](media/readme_header.png)

## What is this? ##

This is *An Introduction to GPU Ray Tracing with Optix*.\
An Introductory text to learning the Nvidia OptiX Ray tracing SDK.

Within the body of the SDK there are a large number of holistic programs that encapsulate an entire ray tracing project. However, at time of writing, there does not exist an adequate introduction publically.\
This text is an attempt to remedy that.\
All projects will be built incremently, one subsection at a time. There should never be more than 1 thing to be learn at a time.

## Expected Experience ##

I expect the minimum from you:
- Some experience in c++

As tools and ideas are introduced, their understanding will be explained. If there is an idea or implementation detail that is not fully explained, that is a **bug** and should be fixed.

## Tools Used by IO ##

The following tools will be used:
- A C++ compiler (Clang, GCC, VS, ...)
- NVCC (For Cuda Compilation)
- Nvidia OptiX SDK
- CMake (for builds)

## Why does it start at Project 2? ##

It doesn't!

At present plan, Project 1 is a Cuda introduction. I explicitly do *not* expect cuda experience for the user. However, there exists adequate cuda introductions on the web already.

So, in the near term, Project 1 and Cuda is of lower priority.

## Repo Organization ##

LICENSE
- The License for this repo is Apache License 2.0
- Basically, you can do whatever you like, provided you maintain existing licenses **and** specify modifications.

README.md
- You're reading it.

media/
- Contains the media for the project, photos

publishing/
- This is the author's internal documentation for the book
- It is of probably zero value to the reader, but included for transparency

source/
- Contains all of the source
- The organization for this directory will change as the project matures

text/
- Contains the text of the book

## Table of Contents ##

In Progress.\
See publishing/book.md

## Acknowledgements ##

Peter Shirley\
Ingo Wald\
João Vítor Silva

## Contributing ##

If you find a problem with the project, whether that is in the source or in the text, I politely request that you file a bug report. Rather than a pull request.

You can also contact me directly at trevordavidblack AT gmail DOT com

## Work Left to Complete ##

Like 85%