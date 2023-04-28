global _ft_strlen

_ft_strlen:
	mov rax, 0				; i = 0;
_loop:
	cmp [rdi+rax], BYTE 0
	je _return				; if (str[i] == '\0') goto _return;
	inc	rax					; i++;
	jmp _loop				; goto _loop;
_return:
	ret						; return i;
