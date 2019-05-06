global main
extern scanf
extern printf
extern fflush
     
section .data
    read    db "%d", 0
    numOut  db "%d", 10, 0
     
section .bss
    a resd 1
    b resd 1
         
section .text
tambah:
        push    ebp                     
        mov     ebp, esp                
        sub     esp, 8                  


        mov     eax, [ebp+12]        
        mov		ebx, [ebp+8]
   
		add		eax, ebx
		
        mov     esp, ebp            ; deallocate local vars
        pop     ebp                 ; restore old ebp
        ret

main:
		push 	a
		push	read
		call	scanf
		add 	esp, 8
		
		push	b
		push	read
		call	scanf
		add 	esp, 8		
		
		push	dword [b]		
        push    dword [a]
        call    tambah        ; sum(25, 10, 5) --> eax = 75
        add     esp, 8
        
        push 	eax
        push	numOut
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
