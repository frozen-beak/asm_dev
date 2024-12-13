global _start

section .text
_start:
	mov ebx, 1	; exit status as result of computation
	mov ecx, 4	; no of iterations to make
loop:
	add ebx, ebx	; ebx += ebx
	dec ecx		; ecx -= 1 (better then [sub ecx, 1])
	cmp ecx, 0	; compare ecx w/ 0
	jg loop		; jump back to [loop] if [ecx > 0]

	mov eax, 1	; sys_exit
	int 0x80
