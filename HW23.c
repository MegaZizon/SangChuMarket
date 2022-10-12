#include <stdio.h>
int moving(int *box,int length);

int main(){
	int N,i,j,cnt=0;
	int box[4]={0},move[100]={0};
	
	scanf("%d",&N);
	for(i=0; i<N; i++){
		scanf("%d",&move[i]);
	}
	
	for(i=0; i<N; i++){
		cnt+=moving(box,move[i]);
	}
	printf("%d\n",cnt);
	
}

int moving(int *box,int length){
	int tempbox[4]={0,};
	int i,cnt=0;
	
	for(i=0; i<4; i++){
		if(box[i]==1 && i+length<4){
			tempbox[i+length]=1;
			tempbox[i]=0;
		}
		else if(box[i]==1 && i+length>=4){
			cnt++;
		}
	}
	
	for(i=0; i<4; i++){
		box[i]=tempbox[i];
	}
	box [ length ] =1;
	return cnt;
}
