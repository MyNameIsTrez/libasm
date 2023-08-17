; Allows other nasm and C files to call our _ft_strlen
global _ft_strlen

; rax register in nasm always holds the return value
; rdi always holds the first argument, in this case str
_ft_strlen:
	mov rax, 0				; i = 0; (mov is = operator)

_loop:
	cmp rdi[rax], BYTE 0	; result = str[i] - 0; (cmp is compare, using - operator)
	je _ret					; if (result == 0) goto _ret; (je is Jump if Equal to 0)

	inc	rax					; i++;
	jmp _loop				; goto _loop; (jmp is jump no matter what)

_ret:
	ret						; return i;
