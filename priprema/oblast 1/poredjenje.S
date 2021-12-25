#program koji u zavisnosti od vrednosti registara ebx i ecx smesta odgovarajuce vrednosti u registar eax
#ebx>ecx 1 ->eax
#ebx=ecx 0 ->eax
#ebx<ecx 2 ->eax
#Katarina Krstin sv57
.section .data
.section .text
.global main
main:
	movl $5, %ecx
	movl $3, %ebx
	cmpl %ecx, %ebx
	je jednako
	jb manje
	ja vece
jednako:
	movl $0, %eax
manje:
	movl $2, %eax
vece:
	movl $1, %eax
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
