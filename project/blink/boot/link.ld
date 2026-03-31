ENTRY(Reset_Handler)

MEMORY
{
    FLASH (rx)  : ORIGIN = 0x20020000, LENGTH = 0x00010000
    RAM   (rwx) : ORIGIN = 0x20040000, LENGTH = 0x00010000
}

__stack_size__ = 0x00002000;
__heap_size__ = 0x00000000;

SECTIONS
{
    .isr_vector :
    {
        . = ALIGN(4);
        KEEP(*(.isr_vector))
        . = ALIGN(4);
    } > FLASH

    .text :
    {
        . = ALIGN(4);
        *(.text*)
        *(.rodata*)
        *(.glue_7)
        *(.glue_7t)
        . = ALIGN(4);
        __etext = .;
    } > FLASH

    __data_load__ = LOADADDR(.data);

    .data : AT(__etext)
    {
        . = ALIGN(4);
        __data_start__ = .;
        *(.data*)
        . = ALIGN(4);
        __data_end__ = .;
    } > RAM

    .bss (NOLOAD) :
    {
        . = ALIGN(4);
        __bss_start__ = .;
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        __bss_end__ = .;
    } > RAM

    .heap (NOLOAD) :
    {
        . = ALIGN(8);
        __heap_start__ = .;
        . = . + __heap_size__;
        __heap_end__ = .;
    } > RAM

    .stack (NOLOAD) :
    {
        . = ALIGN(8);
        __StackLimit = .;
        . = . + __stack_size__;
        __StackTop = .;
    } > RAM

    /DISCARD/ :
    {
        *(.comment)
        *(.note*)
        *(.eh_frame*)
        *(.ARM.exidx*)
        *(.ARM.extab*)
    }
}

ASSERT(__StackTop <= ORIGIN(RAM) + LENGTH(RAM), "RAM overflow: stack exceeds boot RAM")
