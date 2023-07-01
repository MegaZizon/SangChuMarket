#include <stdio.h>

int main(){
	
	int red_start,red_end,blue_start,blue_end;
	int red[102]={0,};
	int blue[102]={0,};
	int i,count=0;
	
	scanf("%d %d %d %d",&red_start,&red_end,&blue_start,&blue_end);
	
	for(i=red_start; i<=red_end; i++){
		if(red_start==-1){
			red[101]=1;
			continue;
		}
		red[i]=1;
	}
	
	for(i=blue_start; i<=blue_end; i++){
		if(blue_start==-1){
			blue[101]=1;
			continue;
		}
		blue[i]=1;
	}
	
	for(i=0; i<102; i++){
		if(red[i]==1 && blue[i]==1){
			count++;
		}
	}
	
	printf("%d",count);
}
