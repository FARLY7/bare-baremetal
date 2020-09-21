#include "led.h"

static void delay(uint32_t cycles)
{
	for(uint32_t i = 0 ; i < cycles ; i++);
}

int main(void)
{
	led_init_all();

	while(1)
	{
		led_on(LED_RED);
		delay(50000);	
		led_off(LED_RED);
		delay(50000);
	}
	return 0;
}
