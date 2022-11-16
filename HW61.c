#include <stdio.h>
#include <string.h>
int main(){
	char str[10]={'\0',};
	char temp[10]={'\0',};
	int L,R,i,index=0;
	
	scanf("%d %d",&L,&R);
	L--;
	R--;
	
	scanf("%s",str);
	for(i=R; i>=L; i--){
		temp[index++]=str[i];
	}
	index=0;
	for(i=L; i<=R; i++){
		str[i]=temp[index++];
	}
	
	printf("%s",str);
	
}
