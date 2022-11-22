#include <stdio.h>

int main(){
	int i,n;
	int person[50];
	int index,count=1;
	
	scanf("%d",&n);
	
	for(i=0; i<n-1; i++){
		scanf("%d",&person[i]);
	}
	
	index=n-2;
	
	while(person[index]!=1){
		index=person[index]-2;
		count++;
	}
	
	printf("%d",count);
}
