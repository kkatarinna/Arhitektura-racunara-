#da li je string palindrom, program treba da koristi kombinovano adresiranje
#Katarina Krstin sv57
.section .data
string: .ascii "Ana Voli   Milovana\0"
palindrom: .long 0
.section .text
.global main
main:
	movl $string, %eax #adresa stringa -> eax
	movl $0, %edi #indeksi
	movl $0, %esi
null: #postaviti jedan indeks na poslednji el niza
	cmpb $0, (%eax, %edi, 1)
	je provera1a
	incl %edi
	jmp null
provera1a: #preskakanje razmaka (pokazivac na pocetak)
	movb (%eax, %esi, 1), %bl
	cmpb $' ', %bl
	jne provera1b
	incl %esi
	jmp provera1a
provera1b: #konverzija malih u velika (da bi lakse poredili sve) od pocetka
	cmpb $'a', %bl
	jb provera2b
	cmpb $'z', %bl
	ja provera2a
	addb $'A'-'a', %bl
provera2a: #preskakanje razmaka (pokazivac na kraj_
	movb (%eax, %edi, 1), %bh
	cmpb $' ', %bh
	jne provera2b
	decl %edi
	jmp provera2a
provera2b: #konverzija malih slova u velika od kraja
	cmpb $'a', %bh
	jb provera3
	cmpb $'z', %bh
	ja provera3
	addb $'A'-'a', %bh
provera3: #da li su isti znaci
	cmpb %bl, %bh
	jne kraj #ako nisu jednaki onda nije palindrom
	incl %esi
	decl %edi
	cmpl %esi, %edi
	jae provera1a
	movl $1, palindrom #jeste palindrom
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
	
