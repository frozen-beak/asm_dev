global _start

section .text
_start:
	mov ebx, 42     ; exit status
	mov eax, 1      ; exit sys call
	jmp skip        ; jump to skip section
	mov ebx, 10	; update exit status (ignored)
skip:
	int 0x80

