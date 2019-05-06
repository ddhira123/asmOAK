extern scanf, printf, fflush

section .data
	scan		db "%s %s", 0
	outp		db "%s", 0
	printno		db "tidak ada", 10, 0
	printnum	db "%d", 10, 0
	
section .bss
	str1		resb 51
	char		resb 2
	
section .text
	global main
	
main:
	cld
	push 	char
	push 	str1
	push 	scan
	call 	scanf
	add 	esp, 12
	
	mov		ecx, 50
	mov		edi, str1
	mov		al, [char]
	repne 	scasb
	
	mov		eax, 50
	sub		eax, ecx
	
	mov		ebx, 0
	cmp		ecx, ebx
	je		tidak
	
	push 	eax
    push	printnum
    call	printf
    add 	esp, 8
    jmp		exit

tidak:
	push	printno
	call	printf
	add 	esp, 4
	
        
exit:   
    push 0              ;fflush cukup sekali di akhir aja
    call fflush
    add esp, 4
            
    ;exit(0)
    mov eax, 1
    mov ebx, 0
    int 80h
	
	
	
