/Users/aniekis/Projects/Home/Desktop/Crystal/crystal-embed/bin/crystal build --cross-compile --target "thumbv7em-none-eabi" --prelude empty --release ./main.cr

arm-none-eabi-gcc -fno-common -O0 -g -mcpu=cortex-m3 -mthumb -funwind-tables -c ./startup.s -o ./startup.o
arm-none-eabi-gcc -fno-common -O0 -g -mcpu=cortex-m3 -mthumb -funwind-tables -c ./core_cm3.c -o ./core_cm3.o
arm-none-eabi-gcc -fno-common -O0 -g -mcpu=cortex-m3 -mthumb -funwind-tables -c ./system_stm32f10x.c -o ./system_stm32f10x.o
arm-none-eabi-gcc -fno-common -O0 -g -mcpu=cortex-m3 -mthumb -funwind-tables -c ./stm32_p103.c -o ./stm32_p103.o
arm-none-eabi-gcc -fno-common -O0 -g -mcpu=cortex-m3 -mthumb -funwind-tables -c ./stm32f10x_gpio.c -o ./stm32f10x_gpio.o
arm-none-eabi-gcc -fno-common -O0 -g -mcpu=cortex-m3 -mthumb -funwind-tables -c ./stm32f10x_rcc.c -o ./stm32f10x_rcc.o
arm-none-eabi-gcc -fno-common -O0 -g -mcpu=cortex-m3 -mthumb -funwind-tables -c ./stm32f10x_exti.c -o ./stm32f10x_exti.o
arm-none-eabi-gcc -fno-common -O0 -g -mcpu=cortex-m3 -mthumb -funwind-tables -c ./stm32f10x_usart.c -o ./stm32f10x_usart.o
arm-none-eabi-gcc -fno-common -O0 -g -mcpu=cortex-m3 -mthumb -funwind-tables -c ./misc.c -o ./misc.o
arm-none-eabi-ld -T ./stm-baremetal.ld -nostartupfile --gc-sections ./core_cm3.o ./system_stm32f10x.o ./startup.o ./stm32_p103.o ./stm32f10x_exti.o ./misc.o ./stm32f10x_gpio.o  ./stm32f10x_rcc.o ./stm32f10x_usart.o ./main.o -o ./a.elf