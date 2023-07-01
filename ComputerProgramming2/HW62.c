#include <stdio.h>
#include <string.h>

int main(){
	int N,i;
	char str[10];
	
	scanf("%d",&N);
	scanf("%s",str);
	for(i=0; i<strlen(str); i++){
		if( str[i] + N > 'z' ){
			str[i] += N -('z'-'a'+1);
		}
		else{
			str[i]+=N;
		}
	}
	printf("%s",str);
}
