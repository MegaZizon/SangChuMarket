#include <stdio.h>
int find(int *room,int index);

int main(){
	int room[200]={0,};
	int move[200];
	
	int N,K,Q;
	int i,j,temp;
	
	scanf("%d %d %d",&N,&K,&Q);
	
	for(i=0; i<K; i++){
		scanf("%d",&temp);
		room[temp]=1;
	}
	
	for(i=0; i<Q; i++){
		scanf("%d",&temp);
		move[i]=temp;
	}
	
	for(i=0; i<Q; i++){
		temp=find(room,move[i]);
		if(room[temp+ 1]==0 && temp+1<=N){
			
			room[temp+ 1]=1;
			room[temp]=0;
		}
	}
	
	for(i=0; i<=N; i++){
		
		if(room[i]==1){
			printf("%d ",i);
		}
	}
	
}

int find(int *room,int index){
	int i,count=0;
	
	for(i=0; i<200; i++){
		if(room[i]==1){
			count++;
		}
		
		if(count==index){
			return i;
		}
	}
	
}
