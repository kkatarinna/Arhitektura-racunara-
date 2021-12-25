#poredjenje u dvostrukoj preciznosti
#Katarina Krstin sv57
.section .data
a:	.quad 50000000000000
b:	.quad 0xFEDCBA9876543210
.section .text
.global main
main:
	movl a+4, %edx #poredjenje visih delova brojeva
	cmpl b+4, %edx
	jg a_vece #jump grater gornji delovi su oznaceni i oni moraju da koriste ove skokove jer oni nose znak
	jl a_manje #jump lover
	
	movl a, %edx
	cmpl b, %edx
	ja a_vece #ovi skokovi su za neoznacene brojeve
	jb a_manje
	
	movl $0, %eax #ako su jednaki eax=0
	jmp kraj
a_vece:
	movl $1, %eax
a_manje:
	movl $-1, %eax
kraj:
	movl $1, %eax
	movl $0, %eax
	int $0x80

