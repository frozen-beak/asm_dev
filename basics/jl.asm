global _start

section .text
_start:
	mov ecx, 90	; data to cmp
	mov ebx, 42	; exit status
	mov eax, 1	; sys_exit
	cmp ecx, 100	; cmp 100 to ecx
	jl skip		; jump to skip if cmp is less then
	mov ebx, 10	; update if jmp is skipped
skip:
	int 0x80

