CC = arm-none-eabi-gcc
MACH = cortex-m4
OPTIMISATION_FLAGS = -O0
CFLAGS = -c -mcpu=$(MACH) -mthumb $(OPTIMISATION_FLAGS) -Wall


all: main.o led.o stm32_startup.o

main.o: main.c
	$(CC) $(CFLAGS) -o $@ $^

led.o: led.c
	$(CC) $(CFLAGS) -o $@ $^

stm32_startup.o: stm32_startup.c
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -rf *.o *.elf *.bin
