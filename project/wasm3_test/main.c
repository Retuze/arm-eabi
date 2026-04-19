#include <stdint.h>
#include <stdio.h>

#include "bsp.h"
#include "wasm3.h"

/*
 * Minimal Wasm v1 module: export "add" (i32, i32) -> i32 = a + b; no imports.
 * Equivalent WAT:
 *   (module (func $add (param i32 i32) (result i32) local.get 0 local.get 1 i32.add)
 *         (export "add" (func $add)))
 */
static const uint8_t wasm_add[] = {
    0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00, 0x01, 0x07, 0x01, 0x60, 0x02, 0x7f, 0x7f, 0x01,
    0x7f, 0x03, 0x02, 0x01, 0x00, 0x07, 0x07, 0x01, 0x03, 0x61, 0x64, 0x64, 0x00, 0x00, 0x0a, 0x09,
    0x01, 0x07, 0x00, 0x20, 0x00, 0x20, 0x01, 0x6a, 0x0b,
};

int main(void)
{
    M3Result       result = m3Err_none;
    IM3Environment env    = NULL;
    IM3Runtime     runtime = NULL;
    IM3Module      module = NULL;
    IM3Function    fn     = NULL;
    uint32_t       sum    = 0;

    pinMode(LED_RED, OUTPUT);

    env = m3_NewEnvironment();
    if (!env) {
        printf("m3_NewEnvironment failed\n");
        goto hang;
    }

    runtime = m3_NewRuntime(env, 8u * 1024u, NULL);
    if (!runtime) {
        printf("m3_NewRuntime failed\n");
        goto hang;
    }

    result = m3_ParseModule(env, &module, wasm_add, (uint32_t)sizeof(wasm_add));
    if (result) {
        printf("m3_ParseModule: %s\n", result);
        goto hang;
    }

    result = m3_LoadModule(runtime, module);
    if (result) {
        printf("m3_LoadModule: %s\n", result);
        goto hang;
    }

    result = m3_CompileModule(module);
    if (result) {
        printf("m3_CompileModule: %s\n", result);
        goto hang;
    }

    result = m3_FindFunction(&fn, runtime, "add");
    if (result) {
        printf("m3_FindFunction: %s\n", result);
        goto hang;
    }

    result = m3_CallV(fn, (uint32_t)40, (uint32_t)2);
    if (result) {
        printf("m3_CallV: %s\n", result);
        goto hang;
    }

    result = m3_GetResultsV(fn, &sum);
    if (result) {
        printf("m3_GetResultsV: %s\n", result);
        goto hang;
    }

    printf("wasm add(40, 2) = %lu (expect 42)\n", (unsigned long)sum);

hang:
    while (1) {
        digitalToggle(LED_RED);
        delay(500);
    }
}
