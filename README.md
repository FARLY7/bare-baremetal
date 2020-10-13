# bare-baremetal

This repository contains an education example of a basic bare-metal project with all fundamental files written from scratch (linker, startup, and makefile).
It is meant to be a well documented example of how to implement the fundamental files required to build, examine, flash, run, and debug applications on an ARM Cortex-M Series microcontroller.

The project is for the [STM32F103C8T6 Blue Pill](https://stm32-base.org/boards/STM32F103C8T6-Blue-Pill.html).

# STM32F103C8T6
* Flash = 128 KB
 * SRAM  = 20 KB
 
# Toolchain
The project uses the `arm-none-eabi-gcc` toolchain.

# Linker Sections
* `.text` - Program instructions (flash).
* `.data` - Initialised global and static variables.
* `.bss` - Unitialised variables.
* `.rodata` - Read-only data.
