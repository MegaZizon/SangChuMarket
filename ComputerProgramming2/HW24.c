#include <stdio.h>
#include <string.h>

void Move(char* S,int index);

int main(){
	int i;
	char S[100];
	char T[100];
	
	scanf("%s",S);
	scanf("%s",T);
	
	if(S[0]!=T[0] || S[1]!=T[1]){
		printf("\nNO\n");
		return 0;
	}
	
	for(i=2; i!=strlen(T); i++){
		if(S[i]!=T[i]){
			if(S[i-1]==S[i-2]){
				Move(S,i);
				i--;
			}
			else{
				printf("\nNO\n");
				return 0;
			}
		}
	}
	
	printf("\nYES\n");
	
	//printf("%s",S);
}


void Move(char* S,int index){
	
	int i;
	int len=strlen(S);
	
	for(i=len+1; i!=index; i--){
		
		S[i]=S[i-1];
		
	}
	S[index]=S[index-1];
	
}
