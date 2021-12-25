#mnozenje pomocu sabiranja
#Katarina Krstin sv57
.section .data
.section .text
.global main
main:
	movl $5, %eax
	movl $3, %ecx
	movl $0, %edx
	cmpl %ecx, %eax #poredimo ih samo da bi smanjili broj iteracija
	jb zameni
	jmp mnozi
zameni:
	xchgl %eax, %ecx
mnozi:
	addl %eax, %edx
	decl %ecx
	cmpl $0, %ecx
	je kraj
	jmp mnozi
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
