#include<stdio.h>
#include<stdlib.h>
int Search(int *A,int Left,int Right){
	int Mid;
	while(Left < Right){
		Mid = (Left + Right) / 2;
		if(A[Mid] < Mid){
			Left = Left + 1;
		}else if(A[Mid] > Mid){
			Right = Right - 1;
		}else{
			return Mid;
		}
	}
	return -1;
}

int main(){
	int A[10] = {1,2,3,4,4,6,7,8,9,10};
	printf("Value = %d", Search(A,0,10));
}
