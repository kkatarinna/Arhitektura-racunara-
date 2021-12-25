#t12 nalazenje karaktera koji nisu ni slovo ni cifra i zamenjivanje njih sa 0
#Katarina Krstin sv57
.section .data

str2:	.ascii "Unesite string: \0"
len2 = . - str2
str3:	.ascii "Ispravljeni string je:\n\0"
len3 = . - str3
MAX = 100
str1:	.fill 100, 1, 42
brzamena:	.long 0
.section .text
.global main
main:
	#ispis prve poruke
	movl $4, %eax
	movl $1, %ebx
	leal str2, %ecx
	movl $len2, %edx
	int $0x80
	
	movl $3, %eax #unos stringa za ispravljanje
	movl $0, %ebx
	leal str1, %ecx
	movl $MAX, %edx
	int $0x80

	movl $str1, %ecx
	movl $0, %edi
	movl %eax, %edx #cuva se duzina stringa
	decl %edx #karakter za kraj stringa necemo menjati
	

provera1:
	movb (%ecx, %edi, 1), %al
	cmpb $'0', %al
	jl zameni

	cmpb $'A', %al
	jl provera2
	
	jmp provera3
provera2:
	cmpb $'9', %al
	ja zameni
provera3:
	cmpb $'a', %al
	jl provera4
	cmpb $'z', %al
	ja zameni
	jmp dalje
provera4:
	cmpb $'Z', %al
	ja zameni
	jmp dalje
zameni:
	movb $'0', %al
	movb %al, (%ecx, %edi, 1)
	incl brzamena
dalje:
	incl %edi
	cmpl %edi, %edx
	je ispis
	jmp provera1
ispis:
	movl $4, %eax #ispis poruke
	movl $1, %ebx
	leal str3, %ecx
	movl $len3, %edx
	int $0x80

	incl %edi
	movl $4, %eax #ispis ispravljenog stringa
	movl $1, %ebx
	leal str1, %ecx
	movl %edi, %edx
	int $0x80
	
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

