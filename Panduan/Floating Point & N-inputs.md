# Floating Point, calling from C

## Basic Floating-Point Arithmetic Instructions.

------------------------------------------------+-----------------------------------------------|
faddp 	->	penambahan			|	fadd dword[a]	-> ditambah variabel a  |
fsubp	->	pengurangan			|	fsub dword[a]	-> dikurang variabel a  |
fmulp	->	perkalian			|	fmul dword[a]	-> dikali variabel a    |
fdivp	->	pembagian			|	fdiv dword[a]	-> dibagi variabel a	|
------------------------------------------------+-----------------------------------------------|

fldpi	-> 	masukin nilai pi ke stack

fld dword[a]	->	masukin nilai variabel a ke stack

fstp qword[b]   -> 	keluarkan nilainya  ke b

Lengkapnya [disini](https://github.com/auriza/x86)

### Keliling Lingkaran..

```      
main:
    push a		; input a
    push fmtScan
    call scanf
    add esp, 8
  
    fld dword[a]   	; masukin nilai variabel a ke stack
    fldpi			; masukan nilai pi
    fmulp		; pi dikali dengan a			
     
    fstp qword[b]  	; pop ke b
     
    push dword[b+4]	; karena popnya qword, dan kita pushnya dword.. maka kita harus push 2x
    push dword[b]	; push dword[b+4] dan push dword[b]
    
	mov eax, 1
    mov ebx, 0
    int 0x80
    
    push fmtPrint	;  print~		; 
    call printf
    add esp,12
 
```

implementasi [disini](https://github.com/realplayer123/asmOAK/blob/master/oak/Keliling%20Lingkaran.asm)


# Input sesuai n

jadi kita inputnya ganentu berapa banyak.. karena sesuai n

Contoh Masukan 1:
```
3
3 2 1
```

Contoh Masukan 2:
```
2
2 1
```

Tidak diketahui berapa banyaknya input

Better: Pake modul jump jump gitu, karena loop memakai ecx

**Counternya jangan pake ecx sama edx**, pakai register **yang lain aja**

### contohnya ada soal pertambahan sesuai n

Contoh Masukan:
```
3
1 2 3
```

Contoh Keluaran:
```
6
```

Implementation [Here](https://github.com/realplayer123/asmOAK/blob/master/oak/Add%20n-inputs.asm)


### Untuk Rataan Suhu dengan implementasi n-inputs [disini](https://github.com/realplayer123/asmOAK/blob/master/oak/Rataan%20Suhu.asm)

