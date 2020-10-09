ENTRY(Reset_Handler)

/* STM32F4VGT6
 * Flash = 1024 KB
 * SRAM1 = 112 KB
 * SRAM2 = 16 KB
 */
MEMORY
{
	FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 1024K	
	SRAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 128K
}

__max_heap_size = 0x400;	/* Symbol declaration */
__max_stack_size = 0x200;	/* Symbol declaration */

SECTIONS
{
	/* NOTE: The Location Counter '.' always tracks VMA of the section in which it is being used */

	/* This section should include .text section of all input files */
	/* It is not relocated by the startup code, so VMA and LMA are the same */
	.text :
	{
		/* Merge all .isr_vector sections of all input files */
		/* Merge all .text sections of all input files */
		/* Merge all .rodata sections of all input files */

		*(.isr_vector)
		*(.text)
		*(.rodata)

		_etext = .; /* Store location counter value to symbol 'end of text' */

	} > FLASH
	/*}> (vma) AT> (lma) */

	/* This section should include .data section of all input files */
	.data :
	{
		/* Here, the location counter resets to start of VMA of this section */
		_sdata = .; /* Store location counter value to symbol 'start_of_data' */

		/* Merge all .data sections of all input files */
		*(.data)

		_edata = .; /* Store location counter value to symbol 'end_of_data' */

	}> SRAM AT> FLASH

	.bss :
	{
		_sbss = .;
		*(.bss)
		_ebss = .;
	}> SRAM
}
