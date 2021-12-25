#sortiranje niza znakova po abecedi
#Katarina Krstin sv57
.section .data
niz:	.ascii "katarinavolinikolu\0"
brel:	.long 18
.section .text
.global main
main:
	movl $niz, %ebx
	movl $18, %esi
spolja:
	decl %esi
	cmpl $0, %esi
	jl kraj
	movl $17, %edi
	movb (%ebx, %esi, 1), %al
unutra:
	movb (%ebx, %edi, 1), %cl
	cmpb %al, %cl
	jg zameni
	decl %edi
	cmpl $0, %edi
	je spolja
	jmp unutra
zameni:
	xchgb %al, %cl
	movb %al, (%ebx, %esi, 1)	
	movb %cl, (%ebx, %edi, 1)
	jmp unutra
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
	
