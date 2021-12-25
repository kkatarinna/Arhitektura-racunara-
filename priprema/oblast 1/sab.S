#sabiranje prvih n prirodnih brojeva, n se nalazi u ecx a rezultat se mora nalaziti u eax na kraju programa
#Katarina Krstin sv57
.section .data
.section .text
.global main
main:
	movl $5, %ecx
	movl $1, %eax
	movl $2, %edx

sabiranje:
	addl %edx, %eax
	incl %edx
	cmpl %edx, %ecx
	jb kraj
	jmp sabiranje
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
