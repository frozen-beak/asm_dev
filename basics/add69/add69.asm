global add69
add69:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	add eax, 69
	mov esp, ebp
	pop ebp
	ret
