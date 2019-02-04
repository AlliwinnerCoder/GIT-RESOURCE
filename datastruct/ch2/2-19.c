#include<stdio.h>
#include<stdlib.h>
#define MAXN 1000
int A[MAXN],B[MAXN];

int IsMainCell(int *A,int n,int probable){
	int cnt = 0;
	int i;
	for(i = 0; i < n;i++){
		if(A[i] == probable){
			cnt++;
		}
	}
	if(cnt > n/2){
		return 1;
	}else{
		return 0;
	}
}

int FindMainCell(int *A,int *B,int n1,int n2){
	if(n1 == 0){
		return -1;
	}
	if(n1 == 1){
		if(IsMainCell(B,n2,A[0])){
			return A[0];
		}else{
			return -1;
		}
	}
	int cnt = 0;
	int i;
	for(i = 0; i + 1 < n1;i++){
		if(A[i] == A[i + 1]){
			B[cnt ++] = A[i];
		}
	}
	
	int res = FindMainCell(B,A,cnt,n1);
	if(res == -1 && n1 % 2 == 1 && IsMainCell(A,n1,A[n1-1])){
		return A[n1 - 1];
	}else{
		return res;
	}	
}

int main(){
	int A[10] = {1,1,1,1,1,1,2,3,4,5};
	printf("Value = %d\n",FindMainCell(A,B,10,0));
}
