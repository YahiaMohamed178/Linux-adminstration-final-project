##########the caesar cipher Cmake file##########

# Set the minimum version of CMake required
cmake_minimum_required(VERSION 3.10)

# Set the project name and version
project(myApp
	VERSION 1.0
    DESCRIPTION "CMake caesar cipher"
	LANGUAGES C)
	
# Set the source files for the project
set(SOURCES
	${CMAKE_SOURCE_DIR}/../modules/caesar_cipher/src/caesar_encrypt.c
	${CMAKE_SOURCE_DIR}/../modules/caesar_cipher/src/caesar_decrypt.c)

# create the static library
add_library(caesar_static STATIC ${SOURCES})
	
# Set the include directory
target_include_directories(caesar_static PRIVATE ${CMAKE_SOURCE_DIR}/../modules/caesar_cipher/inc)

# Specify where to put the library
set_target_properties(caesar_static PROPERTIES ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)
