#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int IsPrime(int N){
	if(N < 0){
		return -1;
	}else if(N == 1){
		return 0;
	}else if(N == 2 || N == 3){
		return 1;
	}
	int i;
	for(i = 2; i < sqrt(N);i++){
		if(N % i == 0){
			return 0;
			break;
		}
	}
	return 1;
}

int main(){
	int N = 7;
	printf("IsPrime = %d",IsPrime(N));
}
