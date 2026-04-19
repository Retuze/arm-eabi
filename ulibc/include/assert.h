#ifndef ULIBC_ASSERT_H
#define ULIBC_ASSERT_H

#ifdef NDEBUG
#define assert(cond) ((void)0)
#else
void ulibc_assert_fail(const char *expr, const char *file, int line) __attribute__((noreturn));
#define assert(cond) ((void)((cond) || (ulibc_assert_fail(#cond, __FILE__, __LINE__), 0)))
#endif

#endif /* ULIBC_ASSERT_H */
