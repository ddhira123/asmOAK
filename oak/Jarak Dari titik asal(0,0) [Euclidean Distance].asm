extern scanf
extern printf
extern fflush

;pake tipe data double, qword
      
section .data
    read    db "%lf %lf", 0
    numOut  db "%lf", 10, 0
    x1		dd 0
    y1		dd 0
      
section .bss
    x2		resq 1
    y2		resq 1
    res		resq 1
          
section .text
	global main
main:
        push	x2
        push    y2
        push 	read
        call 	scanf
        add     esp, 8
		
		finit            		; ST0
		fld		qword [x2]		; ST0 = x2 		ST1 = <NULL>
		fmul	ST0				; ST0 = (x2)^2
		fld		qword [y2]		; ST0 = y2		ST1 = (x2)^2
		fmul	ST0				; ST0 = (y2)^2  ST1 = (x2)^2
		faddp					; ST0 += ST1	ST1 = <NULL>
		
		fsqrt					; ST0 = sqrt(ST0)	
             
        fstp	qword [res] 	; RES = ST0
        
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
