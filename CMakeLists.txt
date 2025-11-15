cmake_minimum_required(VERSION 3.28)
project(reflection CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(${PROJECT_SOURCE_DIR}/project_options.cmake)
include(${PROJECT_SOURCE_DIR}/dependencies.cmake)

reflection_setup_dependencies()

# GCC reflection branch: enable reflection explicitly.
# CMake doesn't know "CXX26" for GNU yet, so we drive the std flag ourselves.
if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    add_compile_options(
        -std=c++26
        -freflection     # P2996 reflection in the Marek branch
    )
endif()

add_subdirectory(src bin)
