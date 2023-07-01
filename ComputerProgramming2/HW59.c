#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main(){
	int N,i,j;
	double max=0;
	int* X,*Y;
	scanf("%d",&N);
	
	X=(int*)malloc(sizeof(int)*N);
	Y=(int*)malloc(sizeof(int)*N);
	for(i=0; i<N; i++){
		scanf("%d %d",&X[i],&Y[i]);
	}
	
	
	for(i=0; i<N; i++){
		for(j=0; j<N; j++){
			if( sqrt( pow(X[i] - X[j],2) + pow(Y[i] - Y[j],2)) > max
				&& i!=j){
				max=sqrt( pow(X[i] - X[j],2) + pow(Y[i] - Y[j],2));
			}
		}
	}
	
	printf("%lf",max);
}
