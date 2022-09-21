#include <stdio.h>

int main(){
	int sequence[2000];
	int i,j,n,count=0;
	
	scanf("%d",&n);
	for(i=0; i<n; i++){
		scanf("%d",&sequence[i]);
	}
	
	for(i=0; i<n-1; i++){
		for(j=i+1; j<n; j++){
			if(i+1==sequence[i] && j+1==sequence[j]){
				printf("(%d, %d) ",sequence[i],sequence[j]);
				count++;
			}
			else if(i+1==sequence[j] && j+1==sequence[i]){
				printf("(%d, %d) ",sequence[j],sequence[i]);
				count++;
			}
		}
	}
	
	printf("\nCount=%d \n",count);
	
	/*printf("\n");
	int cnt=0;
	for(i=0; i<n; i++){
		for(j=i+1; j<n; j++){
			if(i+1==sequence[i] && j+1==sequence[j]){
				printf("(%d, %d)",sequence[i],sequence[j]);
				cnt++;
				if(cnt!=count){
					printf(", ");
				}
			}
			else if(i+1==sequence[j] && j+1==sequence[i]){
				printf("(%d, %d)",sequence[j],sequence[i]);
				cnt++;
				if(cnt!=count){
					printf(", ");
				}
			}
		}
	}*/
	
}
