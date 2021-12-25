#sabiranje prvih n clanova fibonacijevog niza obican program
#Katarina Krstin sv57
#nti fibonacijev clan se nalazi u registru eax
.section .data
.section .text
.global main
main:
	movl $6, %ecx
	movl $1, %eax
	movl $0, %edx
petlja:
	addl %edx, %eax
	xchgl %edx, %eax
	decl %ecx
	cmpl $0, %ecx
	ja petlja
	cmpl %edx, %eax
	jb zameni
	jmp kraj
zameni:
	xchgl %eax, %edx
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
