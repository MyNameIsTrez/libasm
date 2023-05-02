global _ft_strlen

_ft_strlen:
	mov rax, -1				; i = -1;
_loop:
	inc	rax					; i++;
	cmp [rdi+rax], BYTE 0
	jne _loop				; if (str[i] != '\0') goto _loop;
	ret						; return i;
