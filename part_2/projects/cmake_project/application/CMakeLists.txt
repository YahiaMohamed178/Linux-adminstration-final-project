##########the application Cmake file##########

# Set the minimum version of CMake required
cmake_minimum_required(VERSION 3.10)

# Set the project name and version
project(myApp
	VERSION 1.0
    DESCRIPTION "CMake main application"
	LANGUAGES C)
	
# Add subdirectories for the cipher modules
add_subdirectory(${CMAKE_SOURCE_DIR}/../modules/caesar_cipher ${CMAKE_BINARY_DIR}/caesar_cipher)
add_subdirectory(${CMAKE_SOURCE_DIR}/../modules/xor_cipher ${CMAKE_BINARY_DIR}/xor_cipher)
# Define the application
add_executable(output ${CMAKE_SOURCE_DIR}/app.c)

# Set the include directory
target_include_directories(output PRIVATE
	${CMAKE_CURRENT_SOURCE_DIR}/../modules/caesar_cipher/inc
	${CMAKE_CURRENT_SOURCE_DIR}/../modules/xor_cipher/inc)


target_link_libraries(output PRIVATE caesar_static xor_dynamic)

