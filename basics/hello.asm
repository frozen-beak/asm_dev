global _start

section .data
	addr db "Yellow"
	len equ $ - addr

section .text
_start:
	mov [addr], byte 'H'		; replace [Y -> H]
	mov [addr + 5], byte '!'	; replace [w -> !]
	mov eax, 4			; sys_write sys call
	mov ebx, 1			; stdout fd
	mov ecx, addr			; load addr
	mov edx, len			; no of bytes to write
	int 0x80

	mov eax, 1			; sys_exit sys call
	mov ebx, 0			; exit status
	int 0x80
