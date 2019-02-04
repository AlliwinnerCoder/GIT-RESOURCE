#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int Max(int a,int b){
	if(a > b){
		return a;
	}
	return b;
	
}

int MaxSubsequenceSum(int *A,int N){
	int ThisSum = 0;
	int MaxSum = INT_MAX;
	int i;
	for(i = 0; i < N; i++){
		ThisSum += A[i];
		if(MaxSum > ThisSum){
			MaxSum = ThisSum;
		}else if(MaxSum > 0){
			ThisSum = 0;
		}
	}
	return MaxSum;
}

int MinSubsequenceSum(int *A,int N){
	int ThisSum;
	int MinSum = INT_MAX;
	int i,j;
	for(i = 0; i < N; i++){
		ThisSum = 0;
		for(j = i; j < N;j++){
			ThisSum += A[j];
			if(MinSum > ThisSum && ThisSum > 0){
				MinSum = ThisSum;
			}
		}
	}
	return MinSum;
}

int MaxSubseuqenceProduct(int *A,int N){
	int MaxValue = 0;
	int Pos = 0;
	int Old = 0;
	int Nag = 1;
	int i;
	for(i = 0; i < N; i++){
		if(A[i] > 1e-6){
			Pos = Max(Old * A[i],A[i]);
			MaxValue = Max(Pos,MaxValue);
			if(Nag < -1e-6){
				Nag *= A[i];
			}
		}
		else if(A[i] < -1e-6){
			Pos = Max(0,Nag * A[i]);
			MaxValue = Max(MaxValue,Pos);
			Nag = (Old * A[i] > A[i] ? A[i] : Old * A[i]);
		}else{
			Nag = 0;
			Pos = 1;
		}
		Old = Pos;
	}
	return MaxValue;
}

int main(){
	int A[4] = {-1,3,-5,1};
	printf("Value1 = %d\n",MaxSubsequenceSum(A,4));
	printf("Value2 = %d\n",MinSubsequenceSum(A,4));
	printf("Value3 = %d\n",MaxSubsequenceSum(A,4));
}
