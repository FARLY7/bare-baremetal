ENTRY(Reset_Handler)

/*  STM32F103C8T6
 *  Flash = 64KB
 *  SRAM  = 20KB
 */

MEMORY
{
	FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 64K	
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
        . = ALIGN(4); /* Align Location Pointer on 4-byte boundary */

		/* Merge all .isr_vector sections of all input files */
		/* Merge all .text sections of all input files */
		/* Merge all .rodata sections of all input files */

		*(.isr_vector)
		*(.text)
		*(.rodata)

        . = ALIGN(4);
		_etext = .; /* Store location counter value to symbol 'end of text' */
	} > FLASH
	/*}> (vma) AT> (lma) */

	/* This section should include .data section of all input files */
	.data :
	{
        . = ALIGN(4);

		/* Here, the location counter resets to start of VMA of this section */
		_sdata = .; /* Store location counter value to symbol 'start_of_data' */

		/* Merge all .data sections of all input files */
		*(.data)

        . = ALIGN(4);
		_edata = .; /* Store location counter value to symbol 'end_of_data' */

	}> SRAM AT> FLASH

	.bss :
	{
        . = ALIGN(4);
		_sbss = .;

		*(.bss)
		
        . = ALIGN(4);
        _ebss = .;
	}> SRAM
}
