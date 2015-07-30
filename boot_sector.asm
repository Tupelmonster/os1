[org 0x7c00]
;init stack
mov bp, 0xffff
mov sp, bp
push dx

mov si, MSG_REAL_MODE
call print_string

mov si, MSG_LOADING_KERNEL
call print_string

mov al, 9
mov bx, kernel_entry ; (aka 0x7e00)
call read_from_disc


;switching to 32-Bit-Protected-Mode
call switch_to_pm



;
;extern asm libs
;

jmp $

%include "includes/funclib.asm"
%include "includes/funclib_32bit.asm"
%include "includes/switch_to_pm.asm"

[bits 32]

BEGIN_PM:
 ; 0xb8000
 mov esi, MSG_PROT_MODE
 call print_string_pm

 ; jmp to loaded kernel code.
 jmp kernel_entry

jmp $

[bits 16]
;
; Data
;

MSG_REAL_MODE:
 db 'Started in 16-bit  Real Mode',0
MSG_LOADING_KERNEL:
 db 'Loading Kernel for disk to address 0x7e00',0
MSG_PROT_MODE:
 db 'Successfully switched into 32-Bit Protected Mode!',0


times 510-($-$$) db 0
dw 0xAA55

kernel_entry:
 ; Kernel code will be loaded here.
