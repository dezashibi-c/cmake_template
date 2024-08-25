# To bypass clove-unit warnings
if (MSVC)
    add_compile_options(/W4)
else()
    add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# Custom target to group all tests together
add_custom_target(all_tests)

# Function to add tests and their dependencies
# also update all_tests target
function(add_clove_test TEST_NAME DEPS)
    add_executable(${TEST_NAME} tests.c ${TEST_NAME}.c ${DEPS})

    target_include_directories(${TEST_NAME} PRIVATE ../extern/clove-unit)

    add_test(NAME ${TEST_NAME} COMMAND $<TARGET_FILE:${TEST_NAME}> -x)

    add_dependencies(all_tests ${TEST_NAME})
endfunction()

###############################################################################
# TESTS
###############################################################################

add_clove_test(test_math_utils "../src/math_utils.c")
