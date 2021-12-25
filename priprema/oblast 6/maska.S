#prvi zadatak napisi masku nekako boga pitaj kako
#unsigned int maska(unsigned int n, unsigned int v);
.section .text
.global maska
maska:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %ecx

#sad treba proveriti da li je n validan 0<=n<=32

	testl $0b11111111111111111111111111100000, %ecx #proverava da li %ecx vise od 32 jer ako jeste onda ovo z!=0
	jnz greska

#sada se inicijalizuje pocetna vrednost maske
	movl $1, %eax
#sada je potrebno napraviti petlju koja ce da siftuje tu masku n puta u levo da bi se dobila trazena maska
	shll %cl, %eax
#sada treba proveriti da li treba da li je v validan v=0 V v=1
	testl $0b11111111111111111111111111111110, 12(%ebp)
	jnz greska
	
#sada se proverava da li je v=0 ili v=1
	testl $1, 12(%ebp)
	jnz kraj

	notl %eax
	
kraj:
	movl %ebp, %esp
	popl %ebp
	ret

greska:
	movl $0, %eax
	jmp kraj


