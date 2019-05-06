global main
extern scanf
extern printf
extern fflush
    
section .data
    read    db "%d", 0
    matrix  dd  7,  11,  10,  6
            dd  5,   8,   9,  12
            dd  11, 13,  12,  15
    numOut  db "%d", 0
    space 	db " ", 0
    newl	db 10, 0
    
section .bss
    a resd 4
    b resd 4
        
section .text
main:
    push a
    push read
    call scanf
    add esp, 8 ;pop
     
	mov esi, 0
	mov edi, [a]
 
tim:
	mov eax, [matrix+esi]	;proses kali 2 tiap elemen
	mul edi
    add esi, 4
    
    mov  ebx, eax		;print angka
	push ebx
    push numOut
    call printf
    add  esp, 8
	
	mov eax, esi		;membentuk format matriks (modulo 4 = 0)
	mov ecx, 16
	cdq
	div ecx
	cmp edx, 0
	je printnl			;kalo kelipatan 4, cetak "\n", print space otherwise
	jb spaces

spaces:
	push space
	call printf
	add esp, 4
	jmp tim				;biar nge-loop
	
printnl:
	push newl
	call printf
	add esp, 4
	cmp esi, 48			;kalo di elemen ujung exit loop
	jb tim				;selainnya balik ke loop
	
exit:	
	push 0				;fflush cukup sekali di akhir aja
    call fflush
    add esp, 4
           
    ;exit(0)
    mov eax, 1
    mov ebx, 0
    int 80h
