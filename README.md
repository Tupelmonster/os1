# os1
#Command collection:
# "sudo dd if=/dev/sda of=/tmp/freds_real_bootsector bs=512 count=1" //copy own bootsector
# "qemu-system-x86_64 bootsector.bin" // run bootsector in qemu emulator
# "mkisofs -o my_os.iso -b bootsector.bin ." //create .iso
# "truncate bootsector.bin -s 1200k" // fil up .bin
# "nasm boot_sector.asm -f bin -o boot_sector.bin" //asmbly

