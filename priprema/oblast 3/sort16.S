#sortiranje 16-bitnog niza u rastucem poretku
#Katarina Krstin sv57
.section .data
n = 5
niz:	.word 4, 6, -9, 10, 2
.section .text
.global main
main:
	movl $niz, %ebx
	movl $n, %esi
spolja:		#glavna petlja
	decl %esi
	jz kraj_spolja
	movl $n, %edi
unutra:		#unutrasnja petlja
	decl %edi
	jz spolja
	
	movw (%ebx, %edi, 2), %ax
	movw -2(%ebx, %edi, 2), %dx
	cmpw %dx, %ax	#poredjenje sa prethodnikom
	jnl unutra
zameni:	#ako je manji zameni im mesta
	movw %ax, -2(%ebx, %edi, 2)
	movw %dx, (%ebx, %edi, 2)
	jmp unutra
kraj_spolja:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
