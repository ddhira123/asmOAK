extern scanf
extern printf
extern fflush

      
section .data
	readi	db "%d", 0
    read    db "%f", 0
    numOut  db "%.1f", 10, 0
    sum		dd 0
      
section .bss
    n   resd 1
    t1	resd 1
    t2	resd 1
    t3	resd 1
    res	resq 1
          
section .text
	global main
main:
        push    n
        push 	readi
        call 	scanf
        add     esp, 8
		
		mov		edi, [n]
		finit            		; ST0
		fld		dword [sum]		; ST0 = sum = 0
		
rata:	
		push	t1
        push 	read
        call 	scanf
        add     esp, 8
		fadd 	dword [t1]	; ST0 += r
		sub		edi, 1
		cmp		edi, 0		; jgn pake ecx ataupun loop
		ja		rata
             
        
        fidiv	dword [n]	; ST0 /= n
        fstp	qword [res] ; RES = ST0
        
		push    dword [res+4]		
        push    dword [res]			
        push    numOut
        call    printf                  ; %f --> double
        add     esp, 12
        
        
exit:   
    push 0              ;fflush cukup sekali di akhir aja
    call fflush
    add esp, 4
             
    ;exit(0)
    mov eax, 1
    mov ebx, 0
    int 80h
