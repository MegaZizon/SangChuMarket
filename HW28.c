#include <stdio.h>

int main(){
	int k,min=0,hour=21;
	scanf("%d",&k);
	
	min=k%60;
	hour+=k/60;
	hour=hour%24;
	
	if(min<10){
		if(hour<10){
			if(hour==0){
				printf("00:0%d",min);
			}
			else{
				printf("0%d:0%d",hour,min);
			}
		}
		else{
			printf("%d:0%d",hour,min);
		}
	}
	else{
		if(hour<10){
			if(hour==0){
				printf("00:%d",min);
			}
			else{
				printf("0%d:%d",hour,min);
			}
		}
		else{
			printf("%d:%d",hour,min);
		}
	}
}


