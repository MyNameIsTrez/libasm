global _ft_write

extern ___error

; TODO: Make sure to set errno!

_ft_write:
	mov rax, 0x2000004	; ret = write(fd, buf, nbyte
	syscall				; );
	jc err				; if (err) goto err;
	ret					; return ret;
err:
	; TODO: Make tmp copy of rax, since _error() clobbers it
	mov rcx, rax
	call ___error		; *errno_ptr = ___error();
	mov [rax], rcx		; *errno_ptr = 22;
	mov rax, -1			; ret = -1;
	ret					; return ret;

; extern _write
; _ft_write:
; 	sub rsp, 8
; 	call _write	; write(fd, buf, nbyte);
; 	add rsp, 8
; 	ret			; return eax;
