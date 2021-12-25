#deljenje pomocu oduzimanja u dvostrukoj preciznosti
#Katarina Krstin sv57
.section .data
a:	.quad 0x443197acbd010
b:	.quad 0x3316528aca0
k:	.quad 0
o:	.quad 0
greska:	.byte 0
.section .text
.global main
main:
	movl a, %eax
	movl a+4, %edx
	cmpl $0, b
	jne deli
	cmpl $0, b+4
	je deljenjenula
deli:
	cmpl b+4, %edx
	ja deli2
	jl kraj
	cmpl b, %eax
	jl kraj
deli2:
	subl b, %eax
	sbbl b+4, %edx
	addl $1, k
	adcl $0, k+4
	jmp deli
deljenjenula:
	movb $1, greska
kraj:
	#upisivanje ostatka
	movl %eax, o
	movl %edx, o+4
	
	movl $1, %eax
	movl $0, %ebx
	int $0x80
