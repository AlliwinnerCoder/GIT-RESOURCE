#include<stdio.h>
#include<stdlib.h>
int BinarySearch(int *A,int Find,int Size){
	int Low,Mid,High;
	Low = 0;
	High = Size - 1;
	while(Low <= High){
		Mid = (Low + High) / 2;
		if(A[Mid] < Find){
			Low = Mid + 1;
		}else if(A[Mid] > Find){
			High = Mid - 1;
		}else{
			return Mid;
		}
	}
	return -1;
}

int main(){
	int A[10] = {1,2,4,6,7,12,15,18,20,57};
	printf("Find = %d\n", BinarySearch(A,8,10));
}
