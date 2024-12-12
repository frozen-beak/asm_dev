global _start

section .data
	msg db "Hello, World", 0x0a   ; 0x0a is hex for 10 (newLine)
	len equ $ - msg 	      ; Subtracts msg addr from current addr($), resulting in msg len

section .text
_start:
	mov eax, 4      ; Represents sys_write call
	mov ebx, 1      ; stdout fd
	mov ecx, msg    ; bytes to write to stdout
	mov edx, len    ; no of bytes to write
	int 0x80 	; perform sys call

	mov eax, 1 	; exit sys call
	mov ebx, 0 	; exit status
	int 0x80
