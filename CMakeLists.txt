###############################################################################
# GENERAL CONFIGURATIONS AND UTILITIES
###############################################################################
cmake_minimum_required(VERSION 3.20)
set(CMAKE_C_STANDARD 11)
include(cmake/utils.cmake)
include(cmake/raylib.cmake) # comment or remove this line if you don't need it

###############################################################################
# PROJECT SETUP
###############################################################################
project(SimpleCProject LANGUAGES C)
include_directories(include src extern)
include(cmake/configs.cmake)
add_subdirectory(tests)

###############################################################################
# EXECUTABLE TARGETS
###############################################################################
add_executable(main_exe_file 
    src/main.c
    src/math_utils.c
)

define_macro_option(main_exe_file PRINT_GREETINGS ON)

add_executable(game_example
    src/game_example.c
)

enable_raylib_for(game_example) # enable raylib with proper platform support for game_example target only

###############################################################################
# PRE BUILD TESTS
###############################################################################

enable_pre_build_testing(main_exe_file all_tests)

###############################################################################
# POST BUILD FILE COPIES
###############################################################################
set(FILES_TO_COPY
    "${CMAKE_SOURCE_DIR}/LICENSE"
)

define_post_built_copy(main_exe_file "" ${FILES_TO_COPY})
