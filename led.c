#include "led.h"
#include <stdint.h>

/* STM32 Blue Pill Onboard LED = PC13 */

static uint32_t *pRccApb2Enr   = (uint32_t*) (0x40021000 + 0x18);
static uint32_t *pGpioCModeReg = (uint32_t*) (0x40011000 + 0x04);
static uint32_t *pGpioCDataReg = (uint32_t*) (0x40011000 + 0x0C);

/**
 * @brief   Initialise on-board LED.
 */
void led_init(void)
{
    *pRccApb2Enr   |= 1 << 4;   /* Enable GPIOC Clock */
    *pGpioCModeReg |= 1 << 20;  /* Configure PC13 - Ouput */
}

/**
 * @brief   Turn on-board LED on.
 */
void led_on()
{
    *pGpioCDataReg &= ~(1 << 13); /* PC13 - Reset */
}

/**
 * @brief   Turn on-board LED off.
 */
void led_off()
{
    *pGpioCDataReg |=  1 << 13; /* PC13 - Set */
}