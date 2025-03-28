##########the xor cipher Cmake file##########

# Set the minimum version of CMake required
cmake_minimum_required(VERSION 3.10)

# Set the project name and version
project(myApp
	VERSION 1.0
    DESCRIPTION "CMake xor cipher"
	LANGUAGES C)

# Set the source files for the project
set(SOURCES
	${CMAKE_SOURCE_DIR}/../modules/xor_cipher/src/xor_encrypt.c
	${CMAKE_SOURCE_DIR}/../modules/xor_cipher/src/xor_decrypt.c)
	
# create the dynamic(shared) library
add_library(xor_dynamic SHARED ${SOURCES})
	
# Set the include directory
target_include_directories(xor_dynamic PRIVATE ${CMAKE_SOURCE_DIR}/../modules/xor_cipher/inc)

# Specify where to put the library
set_target_properties(xor_dynamic PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)
