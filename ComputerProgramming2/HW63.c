#include <stdio.h>
#include <stdlib.h>

void change_array(int length,int* array);

int main(){
	int product_len,coupon_len,discount,i,sum=0;
	int* product;
	scanf("%d %d %d",&product_len,&coupon_len,&discount);
	
	product=(int*)malloc(sizeof(int)*product_len);
	
	for(i=0; i<product_len; i++){
		scanf("%d",&product[i]);
	}
	
	for(i=0; i<coupon_len; i++){
		change_array(product_len,product);
		if(product[0]<discount)
			product[0]=0;
		else{
			product[0]-=discount;
		}
	}
	
	
	for(i=0; i<product_len; i++){
		sum+=product[i];
	}
	
	printf("%d",sum);
}


void change_array(int length,int *array){
	
	int i,temp;
	for(i=0; i<length; i++){
		if(array[0]<array[i]){
			temp=array[i];
			array[i]=array[0];
			array[0]=temp;
		}
	}
}
