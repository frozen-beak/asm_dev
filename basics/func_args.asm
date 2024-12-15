global _start

section .text
_start:
	push 99
	call mul2
	mov ebx, eax
	mov eax, 1
	int 0x80

mul2:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	add eax, eax
	mov esp, ebp
	pop ebp
	ret



