#include <stdio.h>
#include <stdlib.h> 

int main(){
	char s[4];
	
	scanf("%s",s);
	
	if(s[0]==s[1]&& s[1]==s[2]){
		printf("-1");
		return 0;
	}
	
	if(s[0]==s[1]){
		printf("%c",s[2]);
	}
	else if(s[1]==s[2]){
		printf("%c",s[0]);
		
	}
	else if(s[0]==s[2]){
		printf("%c",s[1]);
	}
	else{
		printf("%c",s[rand()%3]);
	}
	
}
