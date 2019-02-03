#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<string.h>
#define Size 2500
#define CONTAINER 2000000
void Alorithm_pow_N_1(int *A,int n);
void Alorithm_pow_N_2(int *A,int n);
void Alorithm_pow_N_3(int *A,int n);
int RandInt(int leftborder,int rightborder){
	return rand() % (rightborder - leftborder + 1) + leftborder;
}
void Alorithm_pow_N_1(int *A,int n){
	int i,j;
	for(i = 0; i < n; i++){
		int insert;
		do{
			insert = 0;
			A[i] = RandInt(1,n);
			for(j = 0; j < i;j ++){
				if(A[i] == A[j]){
					insert = 1;
					break;
				}
			}
		}while(insert);
	}
}

void Alorithm_pow_N_2(int *A,int n){
	int *Use = (int *)malloc(sizeof(int) * CONTAINER);
	memset(Use,0,sizeof(int) * CONTAINER);
	int i;
	for(i = 0; i < n;i++){
		int ran;
		do{
			ran = RandInt(1,n);
		}while(Use[ran]);
		A[i] = ran;
		Use[ran] = 1;
	}
}

void Alorithm_pow_N_3(int *A,int n){
	int i;
	for(i = 0; i < n; i++){
		A[i] = i + 1;
	}
	for(i = 0; i < n; i++){
		int ran = RandInt(0,n - 1);
		int swap;
		swap = A[ran];
		A[ran] = A[i];
		A[i] = swap;
	}
}
int main(){
	int *A = (int *)malloc(sizeof(int) * Size);
	int StartTime,EndTime;
	int i;
	StartTime = clock();
	Alorithm_pow_N_1(A,Size);
	EndTime = clock();
	for(i = 0 ; i < Size;i++){
		printf("A[%d] = %d\n", i,A[i]);
	}
	printf("CostTime1 = %d\n",EndTime - StartTime);
	StartTime = clock();
	Alorithm_pow_N_2(A,Size);
	EndTime = clock();
	for(i = 0 ; i < Size;i++){
		printf("A[%d] = %d\n", i,A[i]);
	}
	printf("CostTime2 = %d\n",EndTime - StartTime);
	StartTime = clock();
	Alorithm_pow_N_3(A,Size);
	EndTime = clock();
	for(i = 0 ; i < Size;i++){
		printf("A[%d] = %d\n", i,A[i]);
	}
	printf("CostTime3 = %d\n",EndTime - StartTime);
	return 1;
}
