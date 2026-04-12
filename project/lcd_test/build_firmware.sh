#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIGURE_PRESET="${CONFIGURE_PRESET:-clang}"
BUILD_PRESET="${BUILD_PRESET:-firmware}"

cd "${SCRIPT_DIR}"

if [[ ! -f "${SCRIPT_DIR}/build/${CONFIGURE_PRESET}/CMakeCache.txt" ]]; then
    cmake --preset "${CONFIGURE_PRESET}"
fi

has_parallel_arg=0
for arg in "$@"; do
    case "${arg}" in
        -j*|--parallel|--parallel=*)
            has_parallel_arg=1
            break
            ;;
    esac
done

if [[ "${has_parallel_arg}" -eq 1 ]]; then
    cmake --build --preset "${BUILD_PRESET}" "$@"
else
    build_jobs="${BUILD_JOBS:-$(getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1)}"
    cmake --build --preset "${BUILD_PRESET}" --parallel "${build_jobs}" "$@"
fi
