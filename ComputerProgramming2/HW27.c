#include <stdio.h>

int main(){
	int N,Q,i,cnt=0,index=0;
	int query1[500],query2[500];
	char str[500];
	
	scanf("%d %d",&N,&Q);
	scanf("%s",str);
	
	for(i=0; i<Q; i++){
		scanf("%d %d",&query1[i],&query2[i]);
	}
	
	for(i=0; i<Q; i++){
		if(query1[i]==1){
			cnt-=query2[i];
			if(cnt<0){
				cnt+=N;
			}
		}
		else{
			printf("%c\n",str[(cnt+(query2[i]-1))%N]);
		}
	}
	
}
