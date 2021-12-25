#include <stdlib.h>
#include <stdio.h>

void SortNiz64(long long niz[], unsigned brel);

#define NELEM 6
long long niz[]={5, 15, 8, 34359738368LL, 16, 0}

int main(){
	int i;
	printf("Niz pre sortiranja: ");
	for(i=0;i<NELEM;i++)
		printf("%lld ", niz[i]);
	SortNiz64(niz, NELEM);
	printf("\nNIZ posle sortiranja: ");
	for(i=0;i<NELEM;i++)
		printf("%lld ", niz[i]);
	printf("\n");
	return 0;
}
