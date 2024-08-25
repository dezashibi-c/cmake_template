cmake_minimum_required(VERSION 3.20)
project(SimpleCProject LANGUAGES C)

# Set C standard
set(CMAKE_C_STANDARD 11)

# Include directories
include_directories(include)

# Add the src directory
add_subdirectory(src)

# Enable testing
enable_testing()

# Add the tests directory
add_subdirectory(tests)

# Ensure that the main project depends on all tests being built
add_dependencies(main_exe_file all_tests)

# Create a custom target to run tests
add_custom_target(pre_build_tests
    COMMAND ${CMAKE_CTEST_COMMAND} -C $<CONFIG> --output-on-failure --verbose
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    DEPENDS all_tests

    COMMENT "Running Tests..."
)

# Make sure the main executable depends on the tests being run
add_dependencies(main_exe_file pre_build_tests)
