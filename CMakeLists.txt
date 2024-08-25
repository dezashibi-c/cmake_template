cmake_minimum_required(VERSION 3.20)
project(SimpleCProject LANGUAGES C)

set(CMAKE_C_STANDARD 11)

include_directories(include)

# Add the src directory (this directory must include its own CMakeLists.txt file)
add_subdirectory(src)

# Enable CTest feature which is an internal feature of cmake
enable_testing()

# Add the tests directory same as src folder
add_subdirectory(tests)

# Ensure that the main project depends on all tests being built
add_dependencies(main_exe_file all_tests)

# Create a custom target to run tests
add_custom_target(pre_build_tests
    COMMAND ${CMAKE_CTEST_COMMAND} -C $<CONFIG> --output-on-failure --verbose
    DEPENDS all_tests

    COMMENT "Running Tests..."
)

# Make sure the main executable depends on the tests being run
add_dependencies(main_exe_file pre_build_tests)
