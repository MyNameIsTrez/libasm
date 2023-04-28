global _ft_strcmp

_ft_strcmp:
	mov rax, 0				; i = 0;
_loop:
	; // TODO: Return if str1[i] *and* str2[i] are '\0' *at the same time*

	mov rcx, [rdi+rax]		; chr = str1[i];
	cmp rcx, [rsi+rax]
	jl _return_less			; if (chr < str2[i]) goto _return_less;
	jg _return_greater		; if (chr > str2[i]) goto _return_greater;
	cmp rcx, 0
	je _both_reached_end	; if (chr == 0) goto _both_reached_end;
	inc	rax					; i++;
	jmp _loop				; goto _loop;
_return_less:
	mov rax, -1				; i = -1;
	ret						; return i;
_return_greater:
	mov rax, 1				; i = 1;
	ret						; return i;
_both_reached_end:
	mov rax, 0				; i = 0;
	ret						; return i;
