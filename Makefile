cat_boot_sector := $()

all:
	rm -f os_image.bin
	gcc -ffreestanding -c kernel_1.c -o kernel_1.o -m32 
	ld -o kernel_1.bin -Ttext 0x7e00 kernel_1.o -m elf_i386 --oformat binary 
	nasm boot_sector.asm -f bin -o boot_sector.bin 
	cat boot_sector.bin kernel_1.bin > os_image.bin 
	truncate os_image.bin -s 10240 
	qemu-system-x86_64 os_image.bin 
