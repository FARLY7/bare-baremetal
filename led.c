#include "led.h"

/* STM32 Blue Pill Onboard LED = PC13 */

static uint32_t *pRccApb2Enr   = (uint32_t*) 0x40021000 + 0x18;
static uint32_t *pGpioCModeReg = (uint32_t*) 0x40011000 + 0x04;
static uint32_t *pGpioCDataReg = (uint32_t*) 0x40011000 + 0x0C;

static uint32_t test = 100;

void led_init(void)
{
    /* Enable GPIOC Clock */
	*pRccApb2Enr |= (1 << 4);
	
    /* Configure PC13 - Ouput */
	*pGpioCModeReg |=  1 << 20;
}

void led_on()
{
    /* PC13 - Reset */
	*pGpioCDataReg &= ~(1 << 13);
}

void led_off()
{
    /* PC13 - Set */
	*pGpioCDataReg |=  1 << 13;
}

