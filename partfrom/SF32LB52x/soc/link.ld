ENTRY(Reset_Handler)

MEMORY
{
    FLASH (rx)  : ORIGIN = DEFINED(__flash_origin__) ? __flash_origin__ : 0x12020000, LENGTH = DEFINED(__flash_length__) ? __flash_length__ : 0x00E00000
    RAM   (rwx) : ORIGIN = DEFINED(__ram_origin__)   ? __ram_origin__   : 0x20000000, LENGTH = DEFINED(__ram_length__)   ? __ram_length__   : 0x00080000
}

__stack_size__ = DEFINED(__stack_size__) ? __stack_size__ : 0x00004000;
__heap_size__ = DEFINED(__heap_size__) ? __heap_size__ : 0x00000000;

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

    .ramfunc : AT(__etext)
    {
        . = ALIGN(4);
        __ramfunc_load__ = LOADADDR(.ramfunc);
        __ramfunc_start__ = .;
        *(.ramfunc*)
        . = ALIGN(4);
        __ramfunc_end__ = .;
    } > RAM

    __data_load__ = LOADADDR(.data);

    .data : AT(__etext + SIZEOF(.ramfunc))
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

ASSERT(__StackTop <= ORIGIN(RAM) + LENGTH(RAM), "RAM overflow: stack exceeds RAM")
