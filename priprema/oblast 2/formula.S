#realizacija formule a=2*b+c/3 gde su a, b i c brojevi u dvostrukoj preciznosti
#Katarina Krstin sv57
.section .data
a:	.quad 0
b:	.quad 879172639162800
c:	.quad 9
greska:	.byte
.section .text
.global main
main:
	movl b, %eax
	movl b+4, %edx
#mnozenje b sa dva je u principu sabiranje b + b
	addl b, %eax
	adcl b+4, %edx
	jc greskica
	movl %eax, a
	movl %edx, a+4

#deljenje c sa 3
	movl c, %eax
	movl c+4, %edx
	movl $0, %ebx #kolicnik nizi deo
	movl $0, %ecx #visi deo
deljenje:
	cmpl $0, %edx
	jl greskica
	cmpl $3, %eax
	jl saberi
	
	subl $3, %eax
	sbbl $0, %edx
	addl $1, %ebx
	adcl $0, %ecx
	jmp deljenje
saberi:
	addl %ebx, a
	adcl %ecx, a+4
	jmp kraj

greskica:
	movb $1, greska
	
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
