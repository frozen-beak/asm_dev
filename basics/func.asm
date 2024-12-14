global _start

section .text
_start:
	call func	; call the func
	mov eax, 1	; sys_exit
	int 0x80

func:
	mov ebx, 42	; set the exit status
	pop eax		; pop into eax, (i.e. the return location)
	jmp eax		; jump to the return location
