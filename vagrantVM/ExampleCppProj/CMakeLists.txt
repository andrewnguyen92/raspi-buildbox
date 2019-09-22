# Minimum CMake version required to generate
# our build system
cmake_minimum_required(VERSION 3.10)

# Name of our Project
project(ExampleCppProj)

set(CMAKE_CXX_STANDARD 14)

# add_executable creates an executable with
# The given name.
add_executable(ExampleCppProj src/main.cpp)