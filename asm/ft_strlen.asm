    global _ft_strlen

;_ft_strlen:
;	mov rax, 0
;_loop:
;	add	rax, 1
;	cmp rax, 10
;	jl _loop
;    ret

_ft_strlen:
	cmp [rdi], BYTE 0
	je .zero
.nonzero:
	mov rax, 69
    ret
.zero:
	mov rax, 42
	ret
