cmake_minimum_required(VERSION 3.20)
project(SimpleCProject LANGUAGES C)

set(CMAKE_C_STANDARD 11)

include_directories(include)

# Add the src directory (this directory must include its own CMakeLists.txt file)
add_subdirectory(src)

# Only do these if this is the main project, and not if it is included through add_subdirectory
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    # Testing only available if this is the main app
    # Note this needs to be done in the main CMakeLists
    # since it calls enable_testing, which must be in the
    # main CMakeLists.
    # Enable CTest feature which is an internal feature of cmake
    enable_testing()
endif()

# Testing only available if this is the main app
# Emergency override MODERN_CMAKE_BUILD_TESTING provided as well
if((CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME OR MODERN_CMAKE_BUILD_TESTING) AND BUILD_TESTING)

    # Add the tests directory same as src folder
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
endif()