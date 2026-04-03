__ROM_BASE    = 0x12020000;
__ROM_SIZE    = 0x00E00000;
__RAM_BASE    = 0x20000000;
__RAM_SIZE    = 0x00080000;
__STACK_SIZE  = 0x00004000;
__HEAP_SIZE   = 0x00000000;

MEMORY
{
	ROM (rx)  : ORIGIN = __ROM_BASE, LENGTH = __ROM_SIZE
	RAM (rwx) : ORIGIN = __RAM_BASE, LENGTH = __RAM_SIZE
}

ENTRY(Reset_Handler)

SECTIONS
{
    .vectors :
    {
        KEEP(*(.vectors))
        KEEP(*(.isr_vector))
        . = ALIGN(4);
    } > ROM

    .text :
    {
        *(.text*)
        *(.rodata*)
        KEEP(*(.init))
        KEEP(*(.fini))
        . = ALIGN(4);
    } > ROM

    .ARM.extab :
    {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > ROM

	.stack (NOLOAD) :
	{
		. = ALIGN(8);
		__StackLimit = .;
		. = . + __STACK_SIZE;
		. = ALIGN(8);
		__StackTop = .;
	} > RAM
	PROVIDE(__stack = __StackTop);

	.heap (NOLOAD) :
	{
		. = ALIGN(8);
		__end__ = .;
		PROVIDE(end = .);
		. = . + __HEAP_SIZE;
		. = ALIGN(8);
		__HeapLimit = .;
	} > RAM

	.data :
	{
		__data_start__ = .;
		_sdata = .;
		*(.data)
		*(.data.*)
		. = ALIGN(4);
		_edata = .;
		__data_end__ = .;
	} > RAM AT>ROM
	__data_load__ = LOADADDR(.data);

	.ramfunc :
	{
		__ramfunc_start__ = .;
		*(.ramfunc)
		*(.ramfunc.*)
		. = ALIGN(4);
		__ramfunc_end__ = .;
	} > RAM AT>ROM
	__ramfunc_load__ = LOADADDR(.ramfunc);

	.bss (NOLOAD) :
	{
		__bss_start__ = .;
		_sbss = .;
		*(.bss)
		*(.bss.*)
		*(COMMON)
		. = ALIGN(4);
		_ebss = .;
		__bss_end__ = .;
	} > RAM

	.copy.table :
	{
		. = ALIGN(4);
		__copy_table_start__ = .;
		LONG(LOADADDR(.data))
		LONG(ADDR(.data))
		LONG(SIZEOF(.data))
		__copy_table_end__ = .;
	} > ROM

	.zero.table :
	{
		. = ALIGN(4);
		__zero_table_start__ = .;
		LONG(_sbss)
		LONG(_ebss - _sbss)
		__zero_table_end__ = .;
	} > ROM

	__exidx_start = .;
	.ARM.exidx :
	{
		*(.ARM.exidx* .gnu.linkonce.armexidx.*)
	} > ROM
	__exidx_end = .;
}

ASSERT(__StackTop <= ORIGIN(RAM) + LENGTH(RAM), "RAM overflow: stack exceeds RAM")
