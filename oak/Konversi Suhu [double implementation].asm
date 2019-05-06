extern scanf
extern printf
extern fflush
 
;pake tipe data double, qword
       
section .data
    read    db "%lf", 0
    numOut  db "%.2lf", 10, 0
    x1      dd 1.8
    x32		dd 32
       
section .bss
    x2      resq 1
    res     resq 1
           
section .text
    global main
main:
        push    x2
        push    read
        call    scanf
        add     esp, 8
         
        finit                   ; ST0
        fld     qword [x2]      ; ST0 = x2      ST1 = <NULL>
        fmul    dword [x1]		; ST0 = (x2)*1.8
        fiadd	dword [x32]		; ST0 += 32
        
              
        fstp    qword [res]     ; RES = ST0
         
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
