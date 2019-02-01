#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define N 100000
void sort(int *A,int Size){
	int temp = 0;
	int i;
	int j;
	for(i = 0; i < Size;i++){
		for(j = i + 1; j < Size; j++){
			if(A[i] > A[j]){
				temp = A[i];
				A[i] = A[j];
				A[j] = temp;
			}
		}
	}
}
int main(){
	int *A = (int *)malloc(N * sizeof(int));
	int i;
	int k;
	clock_t start,end;
	for(i = 0;i < N; i++){
		A[i] = rand();
	}
	start = clock();
	sort(A,N);
	end = clock();
	k = N/2; 
	printf("A[N/2] = %d,time = %d",A[k],end - start);
	return 0;
}
