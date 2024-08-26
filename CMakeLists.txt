include(cmake/utils.cmake)

###############################################################################
# PROJECT SETUP
###############################################################################
cmake_minimum_required(VERSION 3.20)
project(SimpleCProject LANGUAGES C)
set(CMAKE_C_STANDARD 11)
include_directories(include src extern)
enable_testing()
add_subdirectory(tests)

###############################################################################
# EXECUTABLE TARGETS
###############################################################################
set(MAIN_EXEC_FILE main_exe_file)
add_executable(${MAIN_EXEC_FILE} 
    src/main.c
    src/math_utils.c
)

###############################################################################
# PRE BUILD TESTS
###############################################################################

enable_pre_build_testing(${MAIN_EXEC_FILE} all_tests)
