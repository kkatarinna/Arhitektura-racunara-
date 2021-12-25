#Katarina Krstin sv57
#izbacivanje onih znakova iz stringa
#int Izbaci(char *s);
.section .text
.global Izbaci
Izbaci:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	movl $0, %ebx
	
	movl 8(%ebp), %ecx
	movl $0, %eax
petlja:
	movb (%ecx, %ebx, 1), %dh
	cmpb $0, %dh
	je kraj
	cmpb $'$', %dh
	je izbaci
	cmpb $'!', %dh
	je izbaci
	cmpb $'#', %dh
	je izbaci
	cmpb $'%', %dh
	je izbaci
	cmpb $'&', %dh
	je izbaci
	cmpb $'/', %dh
	je izbaci
	cmpb $'*', %dh
	je izbaci
	incl %ebx
	jmp petlja
izbaci:
	movl $1, %eax
	movb $127, %dh
	movb %dh, (%ecx, %ebx, 1)
	incl %ebx
	jmp petlja
kraj:
	movl %ebp, %esp
	popl %ebp
	ret
