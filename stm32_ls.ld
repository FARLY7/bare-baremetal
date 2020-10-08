ENTRY(Reset_Handler)

/* Symbol is the name of an address */

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

/* Symbol declaration */
__max_heap_size = 0x400;	/* A symbol declaration, not a variable */
__max_stack_size = 0x200;	/* A symbol declaration, not a variable */

/* NOTE: Location counter always tracks VMA of the section in which it is being used */

SECTIONS
{
	/* This section should include .text section of all input files */
	/* It is not relocated by the startup code, so vma and lma are the same */
	.text :
	{
		/* Merge all .isr_vector section of all input files */
		/* Merge all .text section of all input files */
		/* Merge all .rodata section of all input files */

		*(.isr_vector)
		*(.text)
		*(.rodata)

		_etext = .; /* Store the updated location counter value in to a symbol 'end_of_test' */

	} > FLASH
	/*}> (vma) AT> (lma) */

	/* This section should include .data section of all input files */
	.data :
	{
		/* Here, the location counter resets to start of VMA of this section */
		_sdata = .; /* Assign a value to a symbol 'start_of_data' */

		/* Merge all .data section of all input files */
		*(.data)

		_edata = .; /* Assign a value to a symbol 'end_of_data' */

	}> SRAM AT> FLASH

	.bss :
	{
		_sbss = .;
		*(.bss)
		_ebss = .;
	}> SRAM
}
