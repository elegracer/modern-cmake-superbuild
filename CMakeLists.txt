cmake_minimum_required(VERSION 3.11 FATAL_ERROR)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake/Modules")
project(cpp-test VERSION 1.0.0)

# ccache
find_program(CCACHE_FOUND ccache)
if(CCACHE_FOUND)
    message(STATUS "Found CCache")
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
endif(CCACHE_FOUND)

include(CMakeDependentOption)
# superbuild settings
include(SuperBuildDepends)

# cpp standard settings
superbuild_option(cpp17)
superbuild_option(modern-cpp)

# dependencies
superbuild_depend(eigen)
superbuild_depend(fmt)

# always generate PIC code, no matter static or shared library
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# options
option(CORE_OPTION "..." ON)

configure_file(cmake/version.h.in include/core/version.h)

add_library(core)
set_target_properties(core PROPERTIES CXX_EXTENSIONS NO) # -std=c++17, not -std=g++17
target_sources(core
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/include/core/core.h
        ${CMAKE_CURRENT_SOURCE_DIR}/src/core/core.cpp
)
target_include_directories(core
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        ${CMAKE_CURRENT_BINARY_DIR}/include
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
)
target_link_libraries(core
    PUBLIC
        options::modern-cpp
        depends::eigen
        depends::fmt
)

add_subdirectory(utils)
