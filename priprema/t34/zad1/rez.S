#Katarina Krstin sv57
#vraca rezultat prosledjene operacije za dva 64bitna broja 
#long long Racunaj(long long *A, long long *B, char *operacija, int *greska);
.section .text
.global Racunaj
Racunaj:
	pushl %ebp
	movl %esp, %ebp
	#subl $4, %esp #za lokalne promenljive
	pushl %ebx
	movl $0, %ebx

	movl 8(%ebp), %edx
	movl (%edx, %ebx, 8), %ecx
	movl 4(%edx, %ebx, 8), %eax
kraj:
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret
