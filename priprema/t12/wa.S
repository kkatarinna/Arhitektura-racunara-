#zad sa wa od proslih godina
#Napisati asemblerski program koji obradjuje elemente iz zatvorenog intervala [a, b]
#gde si a i b oznacene 32-bitne promenljie. Pre prolaska kroz interval, treba proveriti uslove a>0, b>o, a<b,
#ako neki od uslova nije zadovoljen treba zavrsiti program. Parni el intervala se dodaju na promenljivu rez
#(rez = rez + el), dok se neparni mnoze sa vrednoscu rez (rez = rez * el). Pocetna vrednost promenljive rez je 0
#primer ako je interval [5, 7] rez = rez * 5; rez = rez + 6; rez = rez *7; rez =42
.section .data
rez:	.long 0
a:	.long 5
b:	.long 9
.section .text
.global main
main:
	cmpl $0, a #provere
	jle kraj
	cmpl $0, b
	jle kraj
	movl a, %ecx
	cmpl %ecx, b
	jle kraj #ako su a i b jedna rez je idalje 0
	movl b, %ebx
petlja:
	movl rez, %eax
	mull %ecx
	movl %eax, rez
	incl %ecx
	cmpl %ebx, %ecx
	jg kraj
	addl %ecx, rez
	incl %ecx
	cmpl %ebx, %ecx
	jg kraj
	jmp petlja
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80


