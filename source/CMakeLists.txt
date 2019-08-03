# ======================================================================== #
# Copyright 2018 Ingo Wald                                                 #
#                                                                          #
# Licensed under the Apache License, Version 2.0 (the "License");          #
# you may not use this file except in compliance with the License.         #
# You may obtain a copy of the License at                                  #
#                                                                          #
#     http://www.apache.org/licenses/LICENSE-2.0                           #
#                                                                          #
# Unless required by applicable law or agreed to in writing, software      #
# distributed under the License is distributed on an "AS IS" BASIS,        #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. #
# See the License for the specific language governing permissions and      #
# limitations under the License.                                           #
# ======================================================================== #

# Modified 2019 Trevor David Black

PROJECT(IntroOptix)

CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

INCLUDE(cmake/configure_optix.cmake)

if(NOT SET_UP_CONFIGURATIONS_DONE)
  SET(SET_UP_CONFIGURATIONS_DONE 1)

  # No reason to set CMAKE_CONFIGURATION_TYPES if it's not a multiconfig generator
  # Also no reason mess with CMAKE_BUILD_TYPE if it's a multiconfig generator.
  if(CMAKE_CONFIGURATION_TYPES) # multiconfig generator?
      SET(CMAKE_CONFIGURATION_TYPES "Debug;Release;Profile" CACHE STRING "" FORCE)
  else()
      if(NOT CMAKE_BUILD_TYPE)
#       message("Defaulting to release build.")
        set(CMAKE_BUILD_TYPE Release CACHE STRING "" FORCE)
      endif()
      set_property(CACHE CMAKE_BUILD_TYPE PROPERTY HELPSTRING "Choose the type of build")
      # set the valid options for cmake-gui drop-down list
      set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug;Release;Profile")
  endif()
endif()
MARK_AS_ADVANCED(CUDA_SDK_ROOT_DIR)

SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})
SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})
SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})


# Project Code from here forward

# Project 1
#ADD_SUBDIRECTORY(Project1/Part1/Section1)
ADD_SUBDIRECTORY(Project1/Part1/Section2)
#ADD_SUBDIRECTORY(Project1/Part1/Section3)
#ADD_SUBDIRECTORY(Project1/Part2/Section1)
#ADD_SUBDIRECTORY(Project1/Part2/Section2)
# Project 2
#ADD_SUBDIRECTORY(Project2/Part1)
#ADD_SUBDIRECTORY(Project2/Part2/Section1)
#ADD_SUBDIRECTORY(Project2/Part2/Section2)
#ADD_SUBDIRECTORY(Project2/Part3)
#ADD_SUBDIRECTORY(Project2/Part4)
# Project 3
#ADD_SUBDIRECTORY(Project3/Part1/Section1)
#ADD_SUBDIRECTORY(Project3/Part1/Section2)
#ADD_SUBDIRECTORY(Project3/Part2)
#ADD_SUBDIRECTORY(Project3/Part3/Section1)
#ADD_SUBDIRECTORY(Project3/Part3/Section2)
#ADD_SUBDIRECTORY(Project3/Part4/Section1)
#ADD_SUBDIRECTORY(Project3/Part4/Section2)
#ADD_SUBDIRECTORY(Project3/Part4/Section3)
#ADD_SUBDIRECTORY(Project3/Part5/Section1)
#ADD_SUBDIRECTORY(Project3/Part5/Section2)
