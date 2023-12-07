global ft_write

; TODO: Make sure to set errno!

extern __errno_location


; TODO: !!! I am pretty sure the "syscall" and "call" need to be aligned to 16 bits with a push and pop!


ft_write:
	mov rax, 0x2000004		; ret = write(fd, buf, nbyte
	syscall					; );
	jc err					; if (err) goto err;
	ret						; return ret;
err:
	; TODO: Make tmp copy of rax, since _error() clobbers it
	mov rcx, rax

	; `wrt ..plt` is because we aren't allowed to compile with `-no-pie`:
	; https://stackoverflow.com/a/32853546/13279557
	;
	; In `wrt ..plt`, "wrt" means "with reference to",
	; and "plt" means "procedure linkage table":
	; "plt is used to call external procedures/functions
	; whose address isn't known in the time of linking,
	; and is left to be resolved by the dynamic linker at run time."
	;
	; "Referring to a procedure name using wrt ..plt causes the linker
	; to build a procedure linkage table entry for the symbol,
	; and the reference gives the address of the PLT entry.
	; You can only use this in contexts which would generate a PC-relative relocation normally
	; (i.e. as the destination for CALL or JMP), since ELF contains no relocation type
	; to refer to PLT entries absolutely.":
	; https://www.nasm.us/xdoc/2.13.03/html/nasmdoc7.html#section-7.9.3
	call __errno_location wrt ..plt	; *errno_ptr = __error();

	mov [rax], rcx			; *errno_ptr = 22;
	mov rax, -1				; ret = -1;
	ret						; return ret;

; extern _write
; ft_write:
; 	sub rsp, 8
; 	call _write	; write(fd, buf, nbyte);
; 	add rsp, 8
; 	ret			; return eax;
