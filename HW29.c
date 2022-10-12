#include <stdio.h>
#include <math.h>
#include <stdbool.h>

bool isLight(int K,int checkNum,int* light);
bool isCheckAll(int* check,int* checkCopy,int length);
void sort(int length,double *array);

int main(){
	
	int X[1000],Y[1000],light[1000],check[1000],checkCopy[1000];
	int i,j,l,d_lens=0;
	int N,K;
	double distance[1000]={-1,};
	
	scanf("%d %d",&N,&K);
	
	for(i=0; i<K; i++){
		scanf("%d",&light[i]);
		light[i]-=1;
		check[light[i]]=1;
		checkCopy[light[i]]=1;
	}
	
	for(i=0; i<N; i++){
		scanf("%d %d",&X[i],&Y[i]);
	}
	
	for(i=0; i<K; i++){ 			//빛나는 점과 일반 점 사이의 모든 거리를 구하기 
		for(j=0; j<N; j++){
			
			if( !isLight(K,j,light) ){ //(X[j],Y[j])인덱스값이 빛나는점의 인덱스인가? 
				distance[d_lens]= sqrt( pow(X[ light[i] ] - X[j],2) + pow(Y[ light[i]] - Y[j],2));
				d_lens++;
			}
		}
	}
	
	sort(d_lens,distance);			//구한 거리를 오름차순 정렬 
	
	for(l=0; l<d_lens; l++){		//distance[0]부터 시작 (정렬되었기 때문에 가장 짧은 길이부터시작) 
		for(i=0; i<K; i++){
			for(j=0; j<N; j++){		//distance[l]의 길이로 빛나는점에서 모든점을 연결 가능하다면 
									//check 배열의 모든값은 1이됨 
				if( !isLight(K,j,light) && sqrt( pow(X[ light[i] ] - X[j],2) + pow(Y[ light[i]] - Y[j],2)) <=distance[l]){
					check[j]=1;
				}
			}
		}
		
		if(isCheckAll(check,checkCopy,N)){//check 배열의 모든값이 1이라면, distance[l] 출력 
			printf("%lf\n",distance[l]);
			break;
		}
	}
	
	/*for(i=0; i<d_lens; i++){
		printf("%lf ",distance[i]);
	}*/
	
}

bool isLight(int K,int checkNum,int* light){
			//CheckNum인덱스값이 빛나는점의 인덱스인가? 
	int i;
	
	for(i=0; i<K; i++){
		if( light[i] == checkNum){
			return true;
		}
	}
	return false;
}

void sort(int length,double *array){
	
	int i,j;
	double temp;
	for(i=0; i<length-1; i++){
		for(j=i+1; j<length; j++){
			if(array[i]>array[j]){
				temp=array[i];
				array[i]=array[j];
				array[j]=temp;
			}
		}
	}
}

bool isCheckAll(int* check,int* checkCopy,int length){
	int i,j;
	
	for(i=0; i<length; i++){
		if(check[i]!=1){	
			for(j=0; j<length; j++){
				check[j]=checkCopy[j];
			}
			return false;//초기화 해준 뒤 값 반환 
		}
	}
	return true;
}

