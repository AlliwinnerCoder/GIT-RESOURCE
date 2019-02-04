#include<stdio.h>
#include<stdlib.h>
int Powl(int Value,int N){
	int result = 1;
	while(N){
		if(N % 2){
			result *= Value;
		}
		N >>= 1;
		Value *= Value;
	}
	return result;
}

int main(){
	printf("Value = %d",Powl(5,3));
}
