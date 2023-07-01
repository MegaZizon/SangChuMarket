#include <stdio.h>

int distribution(char *str,char* tempWeight,int length);

int main(){
	int N,weight[10];
	int min,max,i,j,maximum=0;
	char str[10],tempWeight[10];
	
	scanf("%d",&N);
	scanf("%s",str);
	
	for(i=0; i<N; i++){
		scanf("%d",&weight[i]);
	}
	
	min=weight[0];
	max=weight[0];
	
	for(i=0; i<N; i++){
		if(min>weight[i]){
			min=weight[i];
		}
		if(max<weight[i]){
			max=weight[i];
		}
	}
	
	for(i=min; i<=max; i++){
		
		for(j=0; j<N; j++){
			if(weight[j]>i){
				tempWeight[j]='1';
			}
			else{
				tempWeight[j]='0';
			}
		}
		tempWeight[j]='\0';
		if( maximum<distribution(str,tempWeight,N)){
			maximum=distribution(str,tempWeight,N);
		}
		//printf("%d %s\n",i,tempWeight);
		
	}
	printf("%d",maximum);
}


int distribution(char *str,char* tempWeight,int length){
	
	int i,cnt=0;
	
	for(i=0; str[i]!='\0'; i++){
		if(str[i]==tempWeight[i]){
			cnt++;
		}
	}
	return cnt;
	
}
