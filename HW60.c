#include <stdio.h>
void recur(int N);

int main(){
	int N;
	scanf("%d",&N);
	recur(N);
}

void recur(int N){
	if(N!=0){
		recur(N-1);
		printf("%d ",N);
		recur(N-1);
	}
}
