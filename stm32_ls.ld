ENTRY(Reset_Handler) /* Specify the entry function for the .elf */

/*  STM32F103C8T6
 *  Flash = 64KB
 *  SRAM  = 20KB
 */

MEMORY
{
    FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 64K	
    SRAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 20K
}

__max_heap_size  = 0x400;   /* Symbol declaration */
__max_stack_size = 0x200;   /* Symbol declaration */

SECTIONS
{
    /* NOTE: The Location Counter '.' always tracks VMA of the section in which it is being used */

    /*
     * The .text section contains all program code and read-only constants.
     * It is not relocated by the startup code, so VMA and LMA are the same.
     * Load & Run at ROM
     */
    .text :
    {
        _stext = .;     /* Store Location Counter value to symbol 'start of text' */
        . = ALIGN(4);   /* Align Location Counter on 4-byte boundary */

        *(.isr_vector)  /* Merge all .isr_vector sections of all input files */
        *(.text)        /* Merge all .text sections of all input files */
        *(.rodata)      /* Merge all .rodata sections of all input files */

        . = ALIGN(4);   /* Align the Location Counter on 4-byte boundary first */
        _etext = .;     /* Store Location Counter value to symbol 'end of text' */
    } > FLASH
    /*}> (vma) AT> (lma) */

    /*
     * The .data section contains all static and global initialised variables.
     * Load at ROM
     * Run  at RAM
     */
    .data :
    {
        . = ALIGN(4);
        _sdata = .;     /* The Location counter resets to start of VMA of this section */

        *(.data)

        . = ALIGN(4);
        _edata = .;
    }> SRAM AT> FLASH

    /*
     * The .bss section contains uninitialised variables.
     * Load at ROM
     * Run  at RAM
     */
    .bss :
    {
        . = ALIGN(4);
        _sbss = .;

        *(.bss)

        . = ALIGN(4);
        _ebss = .;
    }> SRAM
}
