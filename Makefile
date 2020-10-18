CC = arm-none-eabi-gcc
MACH = cortex-m4
OPTIMISATION_FLAGS = -O0 -g
CFLAGS = -c -mcpu=$(MACH) -mthumb $(OPTIMISATION_FLAGS) -Wall
LDFLAGS = -nostdlib -T stm32_ls.ld -Wl,-Map=output.map

# <target>: <dependancies>
#	<recipe>

all: main.o led.o stm32_startup.o output.elf output.hex

main.o: main.c
	$(CC) $(CFLAGS) -o $@ $^

led.o: led.c
	$(CC) $(CFLAGS) -o $@ $^

stm32_startup.o: stm32_startup.c
	$(CC) $(CFLAGS) -o $@ $^

output.elf: main.o led.o stm32_startup.o
	$(CC) $(LDFLAGS) -o $@ $^

output.hex: output.elf
	arm-none-eabi-objcopy -S -O ihex $^ $@

clean:
	rm -rf *.o *.elf *.bin *.map *.hex
