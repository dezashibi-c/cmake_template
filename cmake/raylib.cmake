# most of codes in this file are retrieved from https://github.com/raysan5/raylib-game-template/blob/main/CMakeLists.txt

# Generate compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(FetchContent)

# Generate compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Dependencies
set(RAYLIB_VERSION 5.0)

FetchContent_Declare(
    raylib
    DOWNLOAD_EXTRACT_TIMESTAMP OFF
    URL https://github.com/raysan5/raylib/archive/refs/tags/${RAYLIB_VERSION}.tar.gz
    FIND_PACKAGE_ARGS
)

FetchContent_MakeAvailable(raylib)

function(enable_raylib_for TARGET_NAME)
    set_property(TARGET ${TARGET_NAME} PROPERTY VS_DEBUGGER_WORKING_DIRECTORY $<TARGET_FILE_DIR:${TARGET_NAME}>)

    if ("${PLATFORM}" STREQUAL "Web")
        add_custom_command(
            TARGET ${TARGET_NAME} PRE_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_SOURCE_DIR}/src/resources/${TARGET_NAME} $<TARGET_FILE_DIR:${TARGET_NAME}>/../resources/${TARGET_NAME}
        )
        #DEPENDS ${TARGET_NAME}
    else()
        add_custom_command(
            TARGET ${TARGET_NAME} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_SOURCE_DIR}/src/resources/${TARGET_NAME} $<TARGET_FILE_DIR:${TARGET_NAME}>/resources/${TARGET_NAME}
        )
        #DEPENDS ${TARGET_NAME}
    endif()

    target_link_libraries(${TARGET_NAME} raylib)

    # Web Configurations
    if ("${PLATFORM}" STREQUAL "Web")
        # Tell Emscripten to build an example.html file.
        set_target_properties(${TARGET_NAME} PROPERTIES SUFFIX ".html")
        target_link_options(${TARGET_NAME} PUBLIC -sUSE_GLFW=3 PUBLIC --preload-file resources/${TARGET_NAME})
    endif()

    # Checks if OSX and links appropriate frameworks (Only required on MacOS)
    if (APPLE)
        target_link_libraries(${TARGET_NAME} "-framework IOKit")
        target_link_libraries(${TARGET_NAME} "-framework Cocoa")
        target_link_libraries(${TARGET_NAME} "-framework OpenGL")
    endif()
endfunction()