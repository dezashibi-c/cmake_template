# Add the test executable
add_executable(test_math_utils tests.c test_math_utils.c ../src/math_utils.c)

# Specify the include directories for the Clove Unit framework
target_include_directories(test_math_utils PRIVATE ../extern/clove-unit)

# Register the test with CTest
add_test(NAME MathUtilsTests COMMAND $<TARGET_FILE:test_math_utils> -x)

# Group all test executables under a single target
add_custom_target(all_tests
    DEPENDS test_math_utils
)
