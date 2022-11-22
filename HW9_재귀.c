#include <stdio.h>
#include <stdlib.h>

int arr[10]={0,};
void recur(int current_len,int prt_num,int max,int len,int* arr);

int main(){
	int max,len;
    scanf("%d %d",&len,&max);
    
    int* arr=(int*)malloc(sizeof(int)*len);
    
    recur(0,1,max,len,arr);
}

void recur(int current_len,int prt_num,int max,int len,int* arr){
	int i;
	if(current_len==len){
		for(i=0; i<len; i++){
			printf("%d ",arr[i]);
		}
		printf("\n");
	}
	else{
		for(i=prt_num; i<=max; i++){
			arr[current_len]=i;
			recur(current_len+1,i+1,max,len,arr);
		}
	}
}



