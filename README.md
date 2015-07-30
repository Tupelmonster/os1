# os1
#Command collection:
# "sudo dd if=/dev/sda of=/tmp/freds_real_bootsector bs=512 count=1" //copy own bootsector
# "qemu-system-x86_64 bootsector.bin" // run bootsector in qemu emulator
# "mkisofs -o my_os.iso -b bootsector.bin ." //create .iso
# "truncate bootsector.bin -s 1200k" // fil up .bin
# "nasm boot_sector.asm -f bin -o boot_sector.bin" //asmbly
# "nasm boot_sector.asm -f bin -o boot_sector.bin && qemu-system-x86_64 boot_sector.bin"
# "gcc -ffreestanding -c <c_files.c> -o <output.o> -m32
# "objdump -M intel -d <file.o>"
# "ld -o <file.bin> -Ttext 0x7e00 <file.o> -m elf_i386 --oformat binary"
# "ndisasm -b32 <file.bin>"
# "cat boot_sector.bin kernel.bin > os_image.bin"
# "truncate os_image.bin -s 10240" //paddout 20 sectors

rm -f os_image.bin && gcc -ffreestanding -c kernel_1.c -o kernel_1.o -m32 && 
ld -o kernel_1.bin -Ttext 0x7e00 kernel_1.o -m elf_i386 --oformat binary &&
nasm boot_sector.asm -f bin -o boot_sector.bin && cat boot_sector.bin kernel_1.bin > os_image.bin && 
truncate os_image.bin -s 10240
