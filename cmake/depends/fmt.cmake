if(NOT TARGET depends::fmt)
    if(NOT TARGET options::modern-cpp)
        message(FATAL_ERROR "depends::fmt expects options::modern-cpp")
    endif()
    FetchContent_Declare(
        depends-fmt
        GIT_REPOSITORY https://github.com/fmtlib/fmt.git
        GIT_TAG        6.1.2
        GIT_SHALLOW    TRUE
    )
    FetchContent_GetProperties(depends-fmt)
    if(NOT depends-fmt_POPULATED)
        message(STATUS "Fetching fmt sources")
        FetchContent_Populate(depends-fmt)
        message(STATUS "Fetching fmt sources - done")
    endif()
    add_subdirectory(${depends-fmt_SOURCE_DIR})
    add_library(depends::fmt INTERFACE IMPORTED GLOBAL)
    target_link_libraries(depends::fmt INTERFACE options::modern-cpp fmt::fmt)
    set(depends-fmt-source-dir ${depends-fmt_SOURCE_DIR} CACHE INTERNAL "" FORCE)
    mark_as_advanced(depends-fmt-source-dir)
endif()
