global _ft_strcpy

_ft_strcpy:
	mov rax, 0				; i = 0;
_loop:
	mov rcx, [rsi+rax]		; chr = src[i];
	mov [rdi+rax], rcx		; dst[i] = chr;
	cmp [rsi+rax], BYTE 0
	je _return				; if (src[i] == '\0') goto _return;
	inc	rax					; i++;
	jmp _loop				; goto _loop;
_return:
	mov rax, rdi			; i = dst;
	ret						; return i;
