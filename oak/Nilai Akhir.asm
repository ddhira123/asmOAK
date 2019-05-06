global main
extern scanf
extern printf
extern fflush
     
section .data
    read    db "%d %d %d %d %d %d %d", 0
    numOut  db "%d", 10, 0
     
section .bss
    tugas	resd 1
    proj	resd 1
    kuis	resd 1
    utsp	resd 1
    uasp	resd 1
    uts		resd 1
    uas		resd 1
         
section .text
nilai:
        push    ebp                     
        mov     ebp, esp                
        sub     esp, 8                  
		
		mov		ecx, 0
		mov 	edi, 30
		mov		esi, 10
		
        mov  eax, 0                  ; eax  = 0
        add  eax, [ebp+8]            ; eax += uts
        mul	 edi
        add	 ecx, eax  
         
        mov  eax, [ebp+12]           ; eax = uas
        mul	 edi
        add	 ecx, eax
         
        mov  eax, [ebp+16]           ; eax = utsp
        mul	 esi
        add	 ecx, eax
         
        mov  eax, [ebp+20]           ; eax = uasp
        mul	 esi
        add	 ecx, eax
         	 
		mov  eax, [ebp+24]           ; eax = projek
        mul	 esi
        add	 ecx, eax
        
        mov  edi, 5
        
        mov  eax, [ebp+28]           ; eax = kuis
        mul	 edi
        add	 ecx, eax
        
        mov  eax, [ebp+32]           ; eax = tugas
        mul	 edi
        add	 ecx, eax
        
        mov	 eax, ecx
        mov	 esi, 100
        cdq
        div	 esi
        
        mov     esp, ebp            ; deallocate local vars
        pop     ebp                 ; restore old ebp
        ret

main:
		;Urutan input = uts, uas, utsp, uasp, proj,kuis, tugas
		push 	tugas
		push	kuis
		push	proj
		push	uasp
		push	utsp
		push	uas
		push	uts
		push	read
		call	scanf
		add 	esp, 32
			
		;nilai(uts,uas,utsp,uasp,...) <- sesuai prinsip stack
		push dword [tugas]
		push dword [kuis]
		push dword [proj]
		push dword [uasp]
		push dword [utsp]
		push dword [uas]
		push dword [uts]
        call    nilai
        add     esp, 28
        
        ;edx = eax % esi
        ;if(edx >= 50) eax += 1 -> untuk cth kasus 7.50
        ;karena 0.50 diabaikan (int), maka perlu pengecekan untuk
        ;aturan truncation (pembulatan)
        cmp		edx, 50
        jb		cetak
		
		add		eax, 1;  inc eax 

cetak:
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
