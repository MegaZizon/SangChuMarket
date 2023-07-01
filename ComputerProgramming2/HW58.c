#include <stdio.h>
#include <stdlib.h>

int main(){
	int N,i,max=0;
	int* mountain;
	
	scanf("%d",&N);
	
	mountain=(int*)malloc(sizeof(int)*N);
	for(i=0; i<N; i++){
		scanf("%d",&mountain[i]);
	}
	
	for(i=1; i<N; i++){
		if(mountain[i-1]>=mountain[i]){
			printf("%d",mountain[i-1]);
			break;
		}
	}
	if(i==N){
		printf("%d",mountain[i-1]);
	}
}

