#include <stdint.h>

#define SRAM_START	0x20000000U
#define SRAM_SIZE	(128U * 1024U) // 128KB
#define SRAM_END	((SRAM_START) + (SRAM_SIZE))

#define STACK_START	SRAM_END

void Reset_Handler(void);

void NMI_Handler(void) 		__attribute__((weak, alias("Default_Handler")));
void HardFault_Handler(void) 	__attribute__((weak, alias("Default_Handler")));

uint32_t vector_tbl[] __attribute__((section(".isr_vectors"))) = {
	STACK_START,
	(uint32_t)Reset_Handler,
	(uint32_t)NMI_Handler,
	(uint32_t)HardFault_Handler
	// Need to add other Interrupt Handlers
};


void Default_Handler(void)
{
	while(1);
}

void Reset_Handler(void)
{
	// Copy .data section to SRAM
	//
	// Init the .bss section to zero in SRAM
	//
	// Call init function of std. library
	//
	// Call main()
}

