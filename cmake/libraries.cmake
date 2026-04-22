# libraries.cmake — registry of available libraries
#
# Each library is registered with a unique name, a source directory, the CMake
# targets it provides, and optionally the other registered libraries it depends
# on.  sdk_require_library() is idempotent and resolves transitive deps.
#
# Usage in project/<name>/project.cmake:
#   set(PROJECT_LIBS rtthread common)

set(_SDK_AVAILABLE_LIBS "")

# ---------------------------------------------------------------------------
# sdk_register_library(<name> <subdir> TARGETS t1 [t2 ...] [DEPENDS d1 ...])
# ---------------------------------------------------------------------------
macro(sdk_register_library _name _subdir)
    cmake_parse_arguments(_REG "" "" "TARGETS;DEPENDS" ${ARGN})
    set(_SDK_LIB_${_name}_DIR     "${_subdir}")
    set(_SDK_LIB_${_name}_TARGETS "${_REG_TARGETS}")
    set(_SDK_LIB_${_name}_DEPENDS "${_REG_DEPENDS}")
    set(_SDK_LIB_${_name}_ADDED   FALSE)
    list(APPEND _SDK_AVAILABLE_LIBS "${_name}")
endmacro()

# ---------------------------------------------------------------------------
# sdk_require_library(<name>)
#   Ensure a library and all its registered dependencies are added (idempotent).
# ---------------------------------------------------------------------------
macro(sdk_require_library _name)
    if(NOT DEFINED _SDK_LIB_${_name}_DIR)
        message(FATAL_ERROR "Unknown library '${_name}'. Available: ${_SDK_AVAILABLE_LIBS}")
    endif()
    if(NOT _SDK_LIB_${_name}_ADDED)
        foreach(_dep ${_SDK_LIB_${_name}_DEPENDS})
            sdk_require_library(${_dep})
        endforeach()
        add_subdirectory(
            "${_SDK_LIB_${_name}_DIR}"
            "${CMAKE_BINARY_DIR}/_libs/${_name}"
        )
        set(_SDK_LIB_${_name}_ADDED TRUE)
    endif()
endmacro()

# ===========================================================================
# Library registry
# ===========================================================================

sdk_register_library(platform
    "${CMAKE_SOURCE_DIR}/platform/SF32LB52x"
    TARGETS platform
)

sdk_register_library(picolibc
    "${CMAKE_SOURCE_DIR}/libc"
    TARGETS picolibc
)

sdk_register_library(rtthread
    "${CMAKE_SOURCE_DIR}/third_party/rt-thread"
    TARGETS rtthread_kernel
    DEPENDS platform picolibc
)

sdk_register_library(common
    "${CMAKE_SOURCE_DIR}/common"
    TARGETS common
    DEPENDS platform
)
