#sabiranje dva niza u dvostrukoj preciznosti
#Katarina Krstin sv57
.section .data
niz1: 	.quad 100, 5000, 300, 204
niz2:	.quad 3601, 333, 2819, 3890
greska:	.byte 0
zbir:	.quad 0, 0, 0, 0
.section .text
.global main
main:
	movl $0, %esi #indeks za veise delove
	movl $1, %edi #indeks za nize delove
	movl $niz1, %eax
	movl $niz2, %edx
sabiranje:
	movl (%eax, %edi, 4), %ebx
	movl (%eax, %esi, 4), %ecx
	addl %ebx, (%edx, %edi, 4)
	adcl %ecx, (%edx, %esi, 4)
	jc greskica
	addl $2, %esi
	addl $2, %edi
	cmpl $8, %edi
	ja kraj
	jmp sabiranje
greskica:
	movb $1, greska
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
