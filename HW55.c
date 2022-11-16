#include <stdio.h>
#include <stdlib.h>

int main(){
	int** array;
	
	int width,height,i,j;
	
	scanf("%d %d",&height,&width);
	
	array=(int**)malloc(sizeof(int)*height);
	for(i=0; i<height; i++){
		array[i]=(int*)malloc(sizeof(int)*width);
		for(j=0; j<width; j++){
			scanf("%d",&array[i][j]);
		}
	}
	
	for(i=0; i<width; i++){
		for(j=0; j<height; j++){
			printf("%d ",array[j][i]);
		}
		printf("\n");
	}
	
	
}

