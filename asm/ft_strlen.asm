global _ft_strlen

_ft_strlen:
	mov rax, 0
_loop:
	cmp [rdi+rax], BYTE 0
	je _return
	inc	rax
	jmp _loop
_return:
	ret
