#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIGURE_PRESET="${CONFIGURE_PRESET:-clang}"

cd "${SCRIPT_DIR}"
rm -rf "${SCRIPT_DIR}/build"
cmake --preset "${CONFIGURE_PRESET}" "$@"
