#include "led.h"

static void delay(uint32_t cycles)
{
    while(cycles--);
}

int main(void)
{
	led_init();

	while(1)
	{
		led_on();
		delay(50000);
		led_off();
		delay(50000);
	}
	return 0;
}
