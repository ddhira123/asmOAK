
extern scanf
extern printf
extern fflush
    
section .data
	fmtScan db "%d", 0
	fmtPrint db "%d", 10, 0
          	 
section .bss
	n resd 1
	a resd 1
    
section .text
	global main
   	 
main:
	push n   		 ; input n
	push fmtScan
	call scanf
	add esp, 8
    
	mov esi, [n]    ; esi buat counter
	mov edi, 0   	 ; tokoh utamanya edi bukan eax
    
input:
    	push a   		 ; input angka lagi
	push fmtScan
	call scanf
	add esp, 8
 
    	mov ebx, [a]    ; ebx = angka inputan
    	add edi, ebx    ; edi = edi + ebx
   	 
    	dec esi   	 ; esi--
   	cmp esi, 0   	 ; compare esi dengan 0
ja input   	 ; jika lebih dari 0, maka masih input
    
   	push edi   	 ; jika tidak lebih dari sama dengan 0, maka print edi(hasil)
	push fmtPrint
	call printf
	add esp, 8
    
exit:
	push 0
	call fflush
	mov eax, 1
	mov ebx, 0
	int 0x80
