#od datih 64bitnih nizova napraviti treci 64bitni niz na zadati nacin
#Katarina Krstin sv57
.section .data
NELEM = 4
A:	.quad 0xFDABC000FFA432, 0x5, 0x3, 0x1425DAF00
B:	.quad 0x123450DD443678, 0x4, 0x7, 0x32000
C:	.quad 0, 0, 0, 0
greska:	.long 0
.section .text
.global main
main:
	movl $0, %edi #indeks
#poredjenje prvo visih delova
poredjenje:
	movl A+4(, %edi, 8), %ecx #visi deo elementa ide u ecx
	movl %ecx, C+4(, %edi, 8) #smestanje viseg dela A u C
	movl A(, %edi, 8), %edx #nizi deo elementa ide u edx
	movl %edx, C(, %edi, 8) #smestanje nizeg dela A u C
	cmpl B+4(, %edi, 8), %ecx
	jg oduzmi_b
	jl dodaj_b
	
#poredjenje manji

	cmpl B(, %edi, 8), %edx
	ja oduzmi_b
	jb dodaj_b

next:
	incl %edi
	cmpl $NELEM, %edi
	je kraj
	jmp poredjenje
oduzmi_b:
	movl B+4(, %edi, 8), %ecx
	movl B(, %edi, 8), %edx
	subl %ecx, C+4(, %edi, 8)
	sbbl %edx, C(, %edi, 8)
	jmp next 

dodaj_b:
	movl B+4(, %edi, 8), %ecx
	movl B(, %edi, 8), %edx
	addl %edx, C(, %edi, 8)
	adcl %ecx, C+4(, %edi, 8)
	jmp next
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
