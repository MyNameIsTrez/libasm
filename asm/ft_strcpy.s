global ft_strcpy

ft_strcpy:
	mov rax, 0				; i = 0;
_loop:
	mov cl, rsi[rax]		; chr = src[i];
	mov rdi[rax], cl		; dst[i] = chr;
	cmp rsi[rax], BYTE 0
	je _return				; if (src[i] == '\0') goto _return;
	inc	rax					; i++;
	jmp _loop				; goto _loop;
_return:
	mov rax, rdi			; i = dst;
	ret						; return i;
