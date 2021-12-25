#Ispisati ime i prezime velikim slovima (realizovati upcase)
#Katarina Krstin sv57
.section .data
poruka1: .ascii "Unesite ime i prezime: \0"
por1len = .-poruka1
poruka2: .ascii "Vi ste: \0"
por2len = .-poruka2
imeprez: .fill 50,1,42
.section .text
.global main

main:
	#ispisati poruku 1
	movl $4, %eax
	movl $1, %ebx
	leal poruka1, %ecx
	movl $por1len, %edx
	int $0x80

	#uneti ime i prezime
	movl $3, %eax
	movl $0, %ebx
	leal imeprez, %ecx
	movl $50, %edx
	int $0x80
	
	movl %eax, %edi #ovde cuvam duzinu imena
	movl $imeprez, %eax

upcase:
	cmpb $97, (%eax)
	jb nastavi
	cmpb $122, (%eax)
	ja nastavi
	subb $32, (%eax)

nastavi:
	incl %eax
	cmpb $10, (%eax)
	jne upcase
	
	
 
	#ispisati poruku 2
	movl $4, %eax
	movl $1, %ebx
	leal poruka2, %ecx
	movl $por2len, %edx
	int $0x80

	#ispis stringa
	movl $4, %eax
	movl $1, %ebx
	leal imeprez, %ecx
	movl %edi, %edx
	int $0x80

kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
