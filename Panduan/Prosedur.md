# Procedure

## Soal kuadrat,
```
inputannya -> proses 	    -> 	hasil
3		 3*3		9
4		 4*4		16
0		[ program berhenti ]
```

**Ceritanya Tidak boleh langsung, harus pake PROCEDURE**

Implementasi [disini](https://github.com/realplayer123/asmOAK/blob/master/oak/Kuadrat.asm)


# Procedure (stack)

Ini pake metode stack
stack itu seperti tumpukkan, dan membaca tumpukkan itu kebalik
 
contoh soal pertambahan 

```
...
main:
push b		; masukan b ke stack (tumpukkan 1)
    	push a		; masukan a ke stack (tumpukkan 2)
    	push fmtScan	; masukan fmtScan ke stack (tumpukkan 3)
    	call scanf	; dipanggil fungsi scanf, membaca tumpukan itu dibalik jadi kita bacanya yg terakhir sampe yang pertama -> fmtScan, a, b -> “%d %d” a b
    	add esp, 12
 
    	push dword [a]	; masukan a ke stack (tumpukkan 1)
    	push dword [b]	; masukan b ke stack (tumpukkan 2)
    	call tambah		; panggil fungsi tambah
     
    	push eax
   	push fmtPrint
    	call printf
    	add esp, 8
     
    jmp exit

tambah:			; fungsi tambah
    push ebp			; masukan ebp ke stack (tumpukan 3) 
    
    (di tumpukkan ada a, b, ebp)
    mov ebp, esp		; ebp = esp ,, oiya esp itu penunjuk tumpukkan yang terakhir
    mov eax, [ebp+3*4]	; eax = a ,, tumpukkan yang ke 3 dari terakhir,, 
    
	; ebp -> penujuk, 3 -> 3 tumpukkan dari terakhir, 4 - > setiap tumpukkan bernilai 4
	; maka jadinya [ebp+3*4] 
    
    add eax, [ebp+2*4]		; eax = eax + b ,, -> eax = a + b ,, [ebp+2*4] - > tumpukkan yang ke 2 dari terakhir
    pop ebp					; keluarkan tumpukkan ebp 
	
	(di tumpukkan tinggal ada a, b ) ,, ebpnya udah di keluarin ,, ada 2 doang di tumpukkan
    
    ret 2*4		; karena ada 2 tumpukkan maka ret 2*4 -> 2 karena ada 2 tumpukkan ,, 4 karena setiap tumpukkan bernilai 4



