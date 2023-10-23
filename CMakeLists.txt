# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.12)

# Project name
project(Shared_Library_Test)

# Specify the C standard for the project (e.g., C11)
set(CMAKE_C_STANDARD 11)

# Set the output directories for executables and libraries
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/build)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# Add the 'include' directory to include directories for all targets
include_directories(${CMAKE_SOURCE_DIR}/include)

# Create a shared library from dyn_math.c
add_library(dmath SHARED src/dyn_math.c)

# Set the output name and version of the shared library
set_target_properties(dmath PROPERTIES
    OUTPUT_NAME "dmath"
    VERSION 1.0
)

# Put all the .o files in the 'build' directory
set_target_properties(dmath PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
)

# Create an executable named "main" from main.c
add_executable(main src/main.c)

# Link the executable with the shared library
target_link_libraries(main dmath)

add_custom_target(run
    COMMAND ${CMAKE_BINARY_DIR}/build/main
    COMMENT "Running the main binary"
    DEPENDS main
)