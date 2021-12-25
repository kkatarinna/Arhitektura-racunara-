#podprogram koji sortira 64bitni niz metodom quick sort
.section .text
.global SortNiz64
SortNiz64:
	pushl %ebp
	movl %esp, %ebp
	subl $32, %esp
	cmpl $1, 12(%esp) #poredjenje broja elemenata (ako ima samo 1 el onda nema sortiranja)
	jbe sort_kraj

	movl $1, -4(%ebp) #index=1 (lokalna promenljiva)
spolja:
	movl $0, -12(%ebp) #indikator zamene
	movl 12(%ebp), %eax #br el niza u eax
	subl $1, %eax
	movl %eax, -8(%ebp) #indekx 2= brel-1
	jmp unutra_uslov
unutra:
	movl -8(%ebp), %eax
	sall $3, %eax #sivtovanje (isto kao mnozenje sa 8) indeks se mora pomnoziti s 8 da bi dobili ceo element
	addl 8(%ebp), %eax
	movl 4(%eax), %edx #stavnjanje viseg dela el u edx
	movl (%eax), %eax #stavljanje nizeg dela el u eax
	movl %eax, -24(%ebp) #cuvanje nizeg dela u lokalnu promenljivu
	movl %eax, -20(%ebp) #cuvanje viseg dela u lokalnu promenljivu
	movl -8(%ebp), %eax
	subl $1, %eax
	sall $3, %eax #sivtovanje (isto kao mnozenje sa 8) indeks se mora pomnoziti s 8 da bi dobili ceo element
	addl 8(%ebp), %eax
	movl 4(%eax), %edx #stavnjanje viseg dela el s indeksom -1 u edx
	movl (%eax), %eax
	movl %eax, -32(%ebp)
	movl %edx, -28(%ebp)
	
	pushl %edx
	pushl %eax
	call BrSet #nadji br jedinica u temp2

unutra_uslov:
	movl -8(%ebp), %eax
	cmpl -4(%ebp), %eax #ako je index2>= od indeks onda moze da radi unutrasnju petlju
	jae unutra

#int BrSet(long long a)
#funkcija koja vraca broj setovanih bitova (jedinica u 64bitnom broju a
