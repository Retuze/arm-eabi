#ifndef RT_CONFIG_H__
#define RT_CONFIG_H__

/* ---------- Kernel basics ------------------------------------------------ */
#define RT_NAME_MAX             12
#define RT_CPUS_NR              1
#define RT_ALIGN_SIZE           8
#define RT_THREAD_PRIORITY_32
#define RT_THREAD_PRIORITY_MAX  32
#define RT_TICK_PER_SECOND      1000
#define RT_USING_OVERFLOW_CHECK

/* ---------- Hook --------------------------------------------------------- */
#define RT_USING_HOOK
#define RT_HOOK_USING_FUNC_PTR
#define RT_USING_IDLE_HOOK
#define RT_IDLE_HOOK_LIST_SIZE  4

/* ---------- Scheduler ---------------------------------------------------- */
#define IDLE_THREAD_STACK_SIZE  512

/* ---------- IPC ---------------------------------------------------------- */
#define RT_USING_SEMAPHORE
#define RT_USING_MUTEX

/* ---------- Memory management -------------------------------------------- */
#define RT_USING_HEAP
#define RT_USING_SMALL_MEM
#define RT_USING_SMALL_MEM_AS_HEAP

/* ---------- Backtrace ---------------------------------------------------- */
#define RT_BACKTRACE_LEVEL_MAX_NR 32

/* ---------- Console / kprintf -------------------------------------------- */
#define RT_USING_CONSOLE
#define RT_CONSOLEBUF_SIZE      128

/* ---------- User main ---------------------------------------------------- */
#define RT_USING_USER_MAIN
#define RT_MAIN_THREAD_STACK_SIZE 2048
#define RT_MAIN_THREAD_PRIORITY   10

/* ---------- Picolibc — we use picolibc, not RT-Thread klibc -------------- */
/* Disable RT-Thread's own kservice printf/string to avoid symbol clashes   */
#define RT_KSERVICE_USING_STDLIB

#endif /* RT_CONFIG_H__ */
