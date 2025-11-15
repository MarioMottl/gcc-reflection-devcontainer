include(${PROJECT_SOURCE_DIR}/cmake/warnings.cmake)
include(${PROJECT_SOURCE_DIR}/cmake/sanitizers.cmake)

macro(check_sanitizer_support)
    if ((CMAKE_CXX_COMPILER_ID MATCHES ".*Clang.*" OR
         CMAKE_CXX_COMPILER_ID MATCHES ".*GNU.*") AND NOT WIN32)
        set(supports_ubsan ON)
        set(supports_thread_sanitizer ON)
    else ()
        set(supports_ubsan OFF)
        set(supports_thread_sanitizer OFF)
    endif ()

    if ((CMAKE_CXX_COMPILER_ID MATCHES ".*Clang.*" OR
         CMAKE_CXX_COMPILER_ID MATCHES ".*GNU.*") AND WIN32)
        set(supports_asan OFF)
        set(supports_thread_sanitizer OFF)
    else ()
        set(supports_asan ON)
        set(supports_thread_sanitizer OFF)
    endif ()
endmacro()

check_sanitizer_support()

if (PROJECT_IS_TOP_LEVEL)
    option(reflection_warnings_as_errors "Treat warnings as errors" ON)
    option(reflection_enable_undefined_behavior_sanitizer "Enable undefined behavior sanitizer" ${supports_ubsan})
    option(reflection_enable_address_sanitizer "Enable address sanitizer" ${supports_asan})
    option(reflection_build_tests "Build tests using Google Test" ON)
else ()
    option(reflection_warnings_as_errors "Treat warnings as errors" OFF)
    option(reflection_enable_undefined_behavior_sanitizer "Enable undefined behavior sanitizer" OFF)
    option(reflection_enable_address_sanitizer "Enable address sanitizer" OFF)
    option(reflection_build_tests "Build tests using Google Test" OFF)
endif ()

add_library(reflection_warnings INTERFACE)
set_warnings(reflection_warnings ${reflection_warnings_as_errors})

add_library(reflection_sanitizers INTERFACE)
enable_sanitizers(
        reflection_sanitizers
        ${reflection_enable_address_sanitizer}
        ${reflection_enable_undefined_behavior_sanitizer}
)

add_library(reflection_options INTERFACE)
target_link_libraries(reflection_options
        INTERFACE reflection_warnings
        INTERFACE reflection_sanitizers
)

