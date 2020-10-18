#include "led.h"

#include <stdint.h>

static void delay(uint32_t cycles)
{
    while(cycles--);
}

int main(void)
{
	led_init(); /* Initialise RCC and GPIO */

	while(1)
	{
		led_on();
		delay(50000);
		led_off();
		delay(50000);
	}
	return 0;
}
