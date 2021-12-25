#spajanje stringova
#Katarina Krstin sv57
.section .data
puprvi:	.ascii "Unesite prvi string: \0"
len1 = . - puprvi
pudrugi: .ascii "Unesite drugi string: \0"
len2 = . - pudrugi
pspoj:	.ascii "Spojeno: \0"
len3 = . - pspoj
max = 20
spojmax = 40
sprvi:	.fill spojmax, 1, 0
sdrugi:	.fill max, 1, 0

prvilen: .long 0
drugilen: .long 0
.section .text
.global main
main:
	movl $4, %eax #ispis prve poruke
	movl $1, %ebx
	leal puprvi, %ecx
	movl $len1, %edx
	int $0x80

	movl $3, %eax #unos prvog stringa
	movl $0, %ebx
	leal sprvi, %ecx
	movl $max, %edx
	int $0x80
	decl %eax
	movl %eax, prvilen

	movl $4, %eax #ispis druge poruke
	movl $1, %ebx
	leal pudrugi, %ecx
	movl $len2, %edx
	int $0x80

	movl $3, %eax #unos drugog stringa
	movl $0, %ebx
	leal sdrugi, %ecx
	movl $max, %edx
	int $0x80
	movl %eax, %ecx
	movl $0, %esi
	movl prvilen, %edi
	
korpirajznak:
	movb sdrugi(,%esi,1), %al
	movb %al, sprvi(,%edi,1)
	incl %esi
	incl %edi
	loop korpirajznak

	movl %edi, prvilen
	
	movl $4, %eax
	movl $1, %ebx
	leal pspoj, %ecx
	movl $len3, %edx
	int $0x80

	movl $4, %eax
	movl $1, %ebx
	leal sprvi, %ecx
	movl prvilen, %edx
	int $0x80
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

	
