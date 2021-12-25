#mnozenje pomocu sabiranja u dvostrukoj preciznosti
#Katarina Krstin sv57
.section .data
a:	.quad 0x10
b:	.quad 0x10000000
r:	.quad 0
error:	.byte 0
.section .text
.global main
main:
	movl b, %eax
	movl b+4, %ebx
mnozi:
	cmpl $0, a
	jne mnozi2
	cmpl $0, a+4
	je kraj
mnozi2:
	addl %eax, r
	adcl %ebx, r+4
	jc greska
	subl $1, a
	sbbl $0, a+4
	jmp mnozi
greska:
	movb $0, error
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
