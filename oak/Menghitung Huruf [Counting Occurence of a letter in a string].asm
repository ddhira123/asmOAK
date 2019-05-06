extern scanf, printf, fflush
 
section .data
    scan        db "%s %s", 0
    outp        db "%s", 0
    printno     db "0", 10, 0
    printnum    db "%d", 10, 0
     
section .bss
    str1        resb 41
    char        resb 2
     
section .text
    global main
     
main:
    cld
    push    char
    push    str1
    push    scan
    call    scanf
    add     esp, 12
    
    mov 	ebx, 0
     
    mov     ecx, 40
    mov     edi, str1
    mov     al, [char]
    
cari:
    repne   scasb
    add		ebx, 1
    cmp		ecx, 0
    ja		cari
         
    sub		ebx, 1	; karena hitung null
    
    push    ebx
    push    printnum
    call    printf
    add     esp, 8
    jmp     exit
 
         
exit:   
    push 0              ;fflush cukup sekali di akhir aja
    call fflush
    add esp, 4
             
    ;exit(0)
    mov eax, 1
    mov ebx, 0
    int 80h
     
     
    
