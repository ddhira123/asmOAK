extern scanf, printf, fflush
global main

      
section .data
    read    db "%f", 0
    numOut  db "%f", 10, 0
      
section .bss
    d   resd 1
    res	resq 1
          
section .text
main:
        push    d
        push 	read
        call 	scanf
        add     esp, 8
             
        finit            	; ST0
        fldpi            	; STO = π
        fmul	dword [d]	; STO *= d
        fstp	qword [res] ; RES = STO
        
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
