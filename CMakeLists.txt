cmake_minimum_required(VERSION 3.5)
project(example C)

find_package(Git)

include(GNUInstallDirs)

if(Git_FOUND)
    execute_process(
        COMMAND ${GIT_EXECUTABLE} describe --all --dirty --abbrev
        OUTPUT_VARIABLE GIT_VERSION
        OUTPUT_STRIP_TRAILING_WHITESPACE
        ERROR_QUIET)
    execute_process(
        COMMAND ${GIT_EXECUTABLE} rev-parse --short HEAD
        OUTPUT_VARIABLE GIT_VERSION_1
        OUTPUT_STRIP_TRAILING_WHITESPACE
        ERROR_QUIET)
    if(NOT GIT_VERSION)
        set(GIT_VERSION "unknown")
    endif()
    set(GIT_VERSION "${GIT_VERSION}-${GIT_VERSION_1}")
    unset(GIT_VERSION_1)
endif()

add_executable(example example.c)

if(GIT_VERSION)
    target_compile_definitions(example PRIVATE -DGIT_HASH="${GIT_VERSION}")
endif()

install(TARGETS example
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})