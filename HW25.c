#include <stdio.h>

int main(){
	int nowAge,answerAge,stopAge,nowHeight,growHeight,i;
	
	scanf("%d %d %d %d %d",&nowAge,&answerAge,&stopAge,&nowHeight,&growHeight);
	
	if(answerAge>=stopAge){
		printf("%d",nowHeight);
	}
	else{
		for(i=0; i<stopAge-answerAge; i++){
			nowHeight-=growHeight;
		}
		printf("%d",nowHeight);
	}
	
}

