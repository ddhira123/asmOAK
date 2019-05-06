extern scanf, printf, fflush

section .data
	scan		db "%s", 0
	printday	db "weekday", 10, 0
	printend	db "weekend", 10, 0
	sun			db "Sun", 0
	sat			db "Sat", 0
	
section .bss
	inp			resb 3
	
section .text
	global main
main:
	push 	inp
	push 	scan
	call 	scanf
	add 	esp, 8
	
	mov	 	esi, sun
	mov 	edi, inp
	CMPSB			; cmp esi++, edi++
	JE		weekend
	
	mov 	esi, sat
	CMPSB			; cmp esi++, edi++
	JE		weekend
	
	push 	printday
	jmp		exit
	
weekend:
	push	printend
	
exit:
	push	scan
	call	printf
	add		 esp, 8

    push 0              ;fflush cukup sekali di akhir aja
    call fflush
    add esp, 4
            
    ;exit(0)
    mov eax, 1
    mov ebx, 0
    int 80h
	
