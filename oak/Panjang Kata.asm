extern scanf, printf, fflush

section .data
	scan		db "%s", 0
	outp		db "%s", 0
	null		db 0
	printnum	db "%d", 10, 0
	
section .bss
	str1		resb 21
	
section .text
	global main
	
main:
	cld
	push 	str1
	push 	scan
	call 	scanf
	add 	esp, 12
	
	mov		ecx, 20
	mov		edi, str1
	mov		al, [null]
	repne 	scasb		
	;<repne scasb> fungsi yg melakukan looping & berhenti saat:
	;1. edi[i] == al
	;2. edi[i] == '\0'
	;3. ecx == 0
	
	mov		eax, 20
	sub		eax, ecx
	
	sub		eax, 1
	
	push 	eax
    push	printnum
    call	printf
    add 	esp, 8
        
exit:   
    push 0              ;fflush cukup sekali di akhir aja
    call fflush
    add esp, 4
            
    ;exit(0)
    mov eax, 1
    mov ebx, 0
    int 80h
	
	
	
