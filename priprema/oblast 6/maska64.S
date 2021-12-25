#drugi zadatak
#maska u dvostrukoj preciznosti
#unsigned long long maska64(unsigned int n, unsigned int v);
.section .text
.global maska64
maska64:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %ecx #n->%cl

	testl $0b11111111111111111111111111000000, %ecx #proverava se da li n izlazi van opsega (vise 0d 63, manje od 0)
	jnz greska

	testl $0b11111111111111111111111111111110, 12(%ebp) #proverava se da li v izlazi van opsega (vise od 1)
	jnz greska

	movl $0b00000000000000000000000000000000, %edx
	movl $0b00000000000000000000000000000001, %eax #inicijalizovanje 64bitne maske

	#pomeranje samo nizeg dela
	shll %cl, %eax
	rcll %cl, %edx

	#provera da li je v=0 ili v=1
	testl $1, 12(%ebp)
	jnz kraj
	
	notl %edx
	notl %eax

kraj:	movl %ebp, %esp
	popl %ebp
	ret

greska:
	movl $0, %eax
	movl $0, %edx
