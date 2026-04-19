#include <stddef.h>

#ifndef NDEBUG
void ulibc_assert_fail(const char *expr, const char *file, int line)
{
    (void)expr;
    (void)file;
    (void)line;
    for (;;) {
        __asm volatile("bkpt #0" ::: "memory");
    }
}
#else
typedef int ulibc_assert_translation_unit_nonempty;
#endif
