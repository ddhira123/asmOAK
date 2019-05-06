# String

seperti di C/C++
format scan nya biasanya %d %d -> %s %s
string beda dengan integer, 

**kalo integer mau mindahin nilai variabel ke register ( mov eax, [variabel] ) (pake [ ] )**

**kalo string mau mindahin nilai variabel ke register ( mov eax, variabel )   (gapake [ ] )**

kalo mau bandingin 2 string Pake..
```
cmpsb
je sama		;jika sama lompat ke fungsi sama
```

## misal di soal Weekend:
```
extern scanf
extern printf
extern fflush
  
section .data
    	fmtScan db "%s", 0		; karena string pake %s
    	kuliah db "weekday", 10, 0	
    	libur db "weekend", 10, 0
   	sun db "Sun", 0
    	sat db "Sat", 0
      
section .bss
    a resd 1
  
section .text
    global main
      
main:
    cld	
    push a		; input a
    push fmtScan
    call scanf
    add esp, 8

    mov esi, a		; esi = a
    mov edi, sun	; edi = “Sun”
    mov ecx, 4		; ecx = 4, karena selalu terdiri dari 4 karakter (S),(u), (n),(null)
    cmpsb		; compare
    je sama		; jump equal, jika sama maka lompat ke fungsi sama, 
					jika tidak sama maka tetap turun
    mov esi, a		; esi = a
    mov edi, sat	; edi = “Sat”
    cmpsb		; compare
    je sama		; jump equal, jika sama maka lompat ke fungsi sama, 
					jika tidak sama maka tetap turun
    mov eax, kuliah	; eax = “weekday”
    push eax		; print eax
    call printf
    add esp, 4
    jmp exit
 
sama:		; fungsi sama
    mov eax, libur	; eax = “weekend”
    push eax		; print eax
    call printf
    add esp, 4
    jmp exit

exit:      
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
```

## misal di soal Mencari Huruf..
```
...         
main:
    cld
    push cari		; d
    push str		; satuduatigaempatlimaenamtujuhdelapansembilansepulu
    push fmtScan	
    call scanf		; input str dan cari
    add esp, 12
       
    mov ecx, 50	; disoal panjang karakternya selalu 50
    mov edi, str		; edi = string awal
    mov al, [cari]	; al = huruf yang kita cari
    repne scasb	; ini semacam loopingan, ecxnya akan berkurang, loopingannya akan selesai kalo dia ketemu dengan huruf yang sama
	ada lagi namanya.. repe scasb -> loopinganny a akan selesai kalo dia ketemu dengan huruf yang beda     
     

     ; kalo di ngikutin inputan soal.. ecxnya akan jadi 45
    mov eax, 50	; eax = 50
    sub eax, ecx	; eax = eax - ecx -> eax = 50 - 45
    mov ebx, 0		; ebx =0
    cmp ecx, ebx	; compare.. ecx sama ebx
    je gaada		; kalo sama sama 0 maka lompat ke fungsi gaada, kalo bukan 0 maka lanjut ke bawah
      
    push eax		; cetak hasilnya
    push fmtPrint
    call printf
    add esp, 8
    jmp exit
   
gaada:
    push tidakAda	; cetak “tidak ada”
    call printf
    add esp, 4
    jmp exit
       
;lanjutkan dgn fflush, exit(0), dkk
```

## Di soal Panjang kata..

Implementasi [disini](https://github.com/realplayer123/asmOAK/blob/master/oak/Panjang%20Kata.asm)
