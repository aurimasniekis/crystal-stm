# put your *.o targets here, make should handle the rest!

SRCS = main.c

LD_SCRIPT = stm-baremetal.ld

# all the files will be generated with this name (main.elf, main.bin, main.hex, etc)

TARGET=main

# that's it, no need to change anything below this line!

###################################################

CC=/Users/aniekis/Projects/Home/Desktop/Crystal/crystal-embed/bin/crystal
OBJCOPY=arm-none-eabi-objcopy
LD=arm-none-eabi-ld

CFLAGS  = build --cross-compile --target "thumbv7em-none-eabi" --prelude empty --release

###################################################

ROOT=$(shell pwd)

OBJS = $(SRCS:.c=.o)

###################################################

.PHONY: proj

all: proj

again: clean all

# Flash the STM32F4
burn:
	st-flash write $(TARGET).bin 0x8000000

.c.o:
	$(CC) $(CFLAGS) $*.c

proj: 	$(TARGET).elf

$(TARGET).elf: $(OBJS)
	$(LD) -T$(LD_SCRIPT) --gc-sections $(OBJS) startup.o -o $(TARGET).elf
	$(OBJCOPY) -O ihex $(TARGET).elf $(TARGET).hex
	$(OBJCOPY) -O binary $(TARGET).elf $(TARGET).bin

clean:
	rm -f *.o
	rm -f $(TARGET).elf
	rm -f $(TARGET).hex
	rm -f $(TARGET).bin
