function(add_clove_test TEST_NAME GROUP DEPS)
    add_executable(${TEST_NAME} tests.c ${TEST_NAME}.c ${DEPS})

    target_include_directories(${TEST_NAME} PRIVATE ../extern/clove-unit)

    add_test(NAME ${TEST_NAME} COMMAND $<TARGET_FILE:${TEST_NAME}> -x)

    add_dependencies(all_tests ${TEST_NAME})

    if(NOT GROUP STREQUAL "")
        add_dependencies(${GROUP} ${TEST_NAME})
    endif()
endfunction()

function(enable_pre_build_testing TARGET_NAME GROUP)
    add_dependencies(${TARGET_NAME} ${GROUP})
    add_custom_target(pre_build_tests_for_${TARGET_NAME}
        COMMAND ${CMAKE_CTEST_COMMAND} -C $<CONFIG> --output-on-failure --verbose
        DEPENDS ${GROUP}

        COMMENT "Pre build tests for `${TARGET_NAME}`..."
    )
    add_dependencies(${TARGET_NAME} pre_build_tests_for_${TARGET_NAME})
endfunction()

function(define_macro_option TARGET_NAME MACRO_NAME DEFAULT_VALUE)
    option(${TARGET_NAME}_ENABLE_${MACRO_NAME} "Enable ${MACRO_NAME} for target='${TARGET_NAME}'" ${DEFAULT_VALUE})
    if(${TARGET_NAME}_ENABLE_${MACRO_NAME})
        target_compile_definitions(${TARGET_NAME} PRIVATE ${MACRO_NAME})
    endif()
endfunction()

function(define_post_built_copy TARGET_NAME FILES_TO_COPY)

    set(DESTINATION_DIR "${CMAKE_SOURCE_DIR}/out/${CMAKE_BUILD_TYPE}")

    add_custom_target(${TARGET_NAME}_copy_files ALL
        COMMAND ${CMAKE_COMMAND} -E echo "Copying files..."
    )

    foreach(FILE ${FILES_TO_COPY})
        get_filename_component(FILE_NAME ${FILE} NAME)

        add_custom_command(
            OUTPUT "${DESTINATION_DIR}/${FILE_NAME}"
            COMMAND ${CMAKE_COMMAND} -E copy_if_different "${FILE}" "${DESTINATION_DIR}/${FILE_NAME}"
            
            DEPENDS "${FILE}"
            COMMENT "Copying ${FILE} to ${DESTINATION_DIR}"
        )

        # Create a unique target for each file based on the file name (without slashes)
        add_custom_target(${TARGET_NAME}_copy_${FILE_NAME} DEPENDS "${DESTINATION_DIR}/${FILE_NAME}")
        add_dependencies(${TARGET_NAME}_copy_files ${TARGET_NAME}_copy_${FILE_NAME})
    endforeach()

    # Ensure the executable depends on the copy_files target
    add_dependencies(${TARGET_NAME} ${TARGET_NAME}_copy_files)
endfunction()
