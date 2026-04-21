# Wrapper for wasm3 (https://github.com/wasm3/wasm3) — upstream lives in ./upstream/
# See docs/third_party/wasm3.md

set(_wasm3_upstream "${CMAKE_CURRENT_LIST_DIR}/upstream/source/m3_core.c")
if(NOT EXISTS "${_wasm3_upstream}")
    message(FATAL_ERROR
        "wasm3 上游源码未找到（缺少 upstream/source/）。\n"
        "请按文档拉取仓库：docs/third_party/wasm3.md")
endif()

set(_wasm3_sources
    upstream/source/m3_api_libc.c
    upstream/source/m3_api_wasi.c
    upstream/source/m3_api_uvwasi.c
    upstream/source/m3_api_meta_wasi.c
    upstream/source/m3_api_tracer.c
    upstream/source/m3_bind.c
    upstream/source/m3_code.c
    upstream/source/m3_compile.c
    upstream/source/m3_core.c
    upstream/source/m3_env.c
    upstream/source/m3_exec.c
    upstream/source/m3_function.c
    upstream/source/m3_info.c
    upstream/source/m3_module.c
    upstream/source/m3_parse.c
)

list(TRANSFORM _wasm3_sources PREPEND "${CMAKE_CURRENT_LIST_DIR}/")

add_library(m3 STATIC ${_wasm3_sources})

target_include_directories(m3 PUBLIC "${CMAKE_CURRENT_LIST_DIR}/upstream/source")

target_compile_features(m3 PRIVATE c_std_99)

target_link_libraries(m3 PUBLIC picolibc_rt)

if(CMAKE_C_COMPILER_ID MATCHES "MSVC")
    # MSVC: extend here if you build with cl
else()
    set_source_files_properties("${CMAKE_CURRENT_LIST_DIR}/upstream/source/m3_env.c"
        PROPERTIES COMPILE_OPTIONS "-Wno-sign-compare")
endif()
