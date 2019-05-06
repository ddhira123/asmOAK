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
duapangkat:
        push    ebp                     
        mov     ebp, esp                
        sub     esp, 8                  


        mov     ecx, [ebp+8]        ; eax = 1, ecx=n
        mov 	eax, 1
        mov		ebx, 2
   
	l1:
        mul		ebx		            ; eax *= 2
        loop	l1

        mov     esp, ebp            ; deallocate local vars
        pop     ebp                 ; restore old ebp
        ret

main:
		push 	a
		push	read
		call	scanf
		add 	esp, 8
		
		mov		ebx, 0
		cmp		dword[a], ebx
		je		exit		
				
        push    dword [a]
        call    duapangkat          ; sum(25, 10, 5) --> eax = 75
        add     esp, 4
        
        push 	eax
        push	numOut
        call	printf
        add 	esp, 8
        jmp		main
        
exit:   
    push 0              ;fflush cukup sekali di akhir aja
    call fflush
    add esp, 4
            
    ;exit(0)
    mov eax, 1
    mov ebx, 0
    int 80h
