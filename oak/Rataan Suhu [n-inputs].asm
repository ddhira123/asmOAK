extern printf
extern fflush
extern scanf
  	 
section .data
	fmtScan db "%f", 0		; format input buat bil 
	fmtN db "%d", 0		; format input n 
	fmtPrint db "%.1f", 10, 0	; format print
	sum dd 0.0  	 		; buat hitungan awalnya
      	 
section .bss
    n resd 1
    bil resd 1
    result resd 1
 	 
section .text
	global main
      	 
main:
    push n			
	push fmtN
	call scanf
    
	mov edi, [n]		; buat counter looping, jangan pake (loop) (ecx)
    	fld dword[sum]	; awalan hitungan 0.0 
    
looping:
    push bil		; input bilangan sebanyak n
    push fmtScan
    call scanf
    add esp, 8
    
    fadd dword[bil]	; ditambah sama inputan
    
    sub edi, 1		; counternya(edi) -1 
    cmp edi, 0		; compare sampe tidak sama dengan 0
    jne looping

    fidiv dword[n]	; dibagi n, kenapa pake fidiv dan bukan fdiv ? karena n itu integer bukan floating point.. jadinya pake fidiv bukan fdiv
    fst qword[result]
    

    push dword[result+4]	; print hasil
    push dword[result]
    push fmtPrint
    call printf

exit:
	push 0
	call fflush
	mov eax, 1
	mov ebx, 0
	int 0x80
