#include <stdio.h>
#include <stdlib.h>

void recur(int cur_len,int ptr_num,int* arr);
int len,max,hap;

int main(){
	int *arr;
	scanf("%d %d %d",&len,&max,&hap);
	
	arr=(int*)malloc(sizeof(int)*len);
	
	recur(0,1,arr);
}

void recur(int cur_len,int ptr_num,int* arr){
	int i,sum=0;
	if(len==cur_len){
		for(i=0; i<len; i++){
			sum+=arr[i];//printf("%d ",arr[i]);
			if(arr[i]>max)
				return ;
		}
		if(sum<=hap){
			for(i=0; i<len; i++){
				printf("%d ",arr[i]);
			}
			printf("\n");
		}
	}
	else{
		for(i=ptr_num; i<=max; i++){
			arr[cur_len]=i;
			recur(cur_len+1,ptr_num,arr);
		}
	}
}
