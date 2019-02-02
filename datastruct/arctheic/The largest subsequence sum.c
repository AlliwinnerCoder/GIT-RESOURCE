#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define Size 1000
int MaxSubsequenceSum1(int *A,int N){
	int ThisSum;
	int MaxSum = INT_MIN; 
	int i,j,k;
	for(i = 0; i < N; i++){
		for(j = i; j < N; j++){
			ThisSum = 0;
			for(k = i; k <= j; k++){
				ThisSum += A[k];
			}
			if(ThisSum > MaxSum){
				MaxSum = ThisSum;
			}
		}
	}
	return MaxSum;
}

int MaxSubsequenceSum2(int *A,int N){
	int ThisSum;
	int MaxSum = INT_MIN;
	int i,j;
	for(i = 0; i < N; i++){
		ThisSum = 0;
		for(j = i;j < N;j++){
			ThisSum += A[j];
			if(ThisSum > MaxSum){
			    MaxSum = ThisSum;
		    }
		}
	}
	return MaxSum;
}

static Max3(int a,int b,int c){
	int d = a;
	if(b > d){
		d = b;
	}
	if(c > d){
		d = c;
	}
	return d;
}

int MaxSubsequenceSum3(int *A,int N){
	int ThisSum = 0;
	int MaxSum = INT_MIN;
	int i;
	for(i = 0; i < N; i++){
		ThisSum += A[i];
		if(ThisSum > MaxSum){
			MaxSum = ThisSum;
		}else if(ThisSum < 0){
			ThisSum = 0;
		}
	}
	return MaxSum;
}

int main(){
	int MaxSize = Size;
	int *A = (int *)malloc(sizeof(int) * MaxSize);
	int i;
	int StartTime; 
	int EndTime;
	int Result1 = 0,Result2 = 0,Result3 = 0,Result4 = 0;	
	for(i = 0; i < MaxSize; i++){
		A[i] = rand() % 10;
	}
	StartTime = clock();
	Result1 = MaxSubsequenceSum1(A,MaxSize);
	EndTime = clock();
	printf("MaxSum1 = %d,CostTime = %d\n",Result1,EndTime - StartTime);
	
	StartTime = clock();
	Result2 = MaxSubsequenceSum2(A,MaxSize);
	EndTime = clock();
	printf("MaxSum2 = %d,CostTime = %d\n",Result2,EndTime - StartTime);
	
	StartTime = clock();
	Result3 = MaxSubsequenceSum3(A,MaxSize);
	EndTime = clock();
	printf("MaxSum3 = %d,CostTime = %d\n",Result3,EndTime - StartTime);
}
