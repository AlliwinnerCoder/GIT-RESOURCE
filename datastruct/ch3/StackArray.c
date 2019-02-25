#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "StackArray.h"
#define EmptyTOS -1
#define MinStackSize 5

struct StackRecord{
	int Capacity;
	int TopOfStack;
	int *Array;
};

Stack CreateStack(int MaxElements){
	Stack S;
	if(MaxElements < MinStackSize){
		printf("Stack size is too small");
	}
	
	S = malloc(sizeof(struct StackRecord));
	if(S == NULL){
		printf("Out of Space !!!");
	}
	
	S->Array = malloc(sizeof(int) * MaxElements);
	if(S->Array == NULL){
		printf("Out of space !!!");
	}
	S->Capacity = MaxElements;
	MakeEmpty(S);
	return S;
}

void DisposeStack(Stack S){
	if(S != NULL){
		free(S->Array);
		free(S);
	}
}

int IsEmpty(Stack S){
	return S->TopOfStack == EmptyTOS;
}

void MakeEmpty(Stack S){
	S->TopOfStack = EmptyTOS;
}

int IsFull(Stack S){
	return (S->TopOfStack + 1) == S->Capacity;
}

void Push(int X,Stack S){
	if(IsFull(S)){
		printf("Full stack");
	}else{
		S->Array[++S->TopOfStack] = X;
	}
}

int Top(Stack S){
	if(!IsEmpty(S)){
		return S->Array[S->TopOfStack];
	}
	printf("Empty stack");
	return 0;
}

void Pop(Stack S){
	if(IsEmpty(S)){
		printf("Empty stack");
	}else{
		S->TopOfStack--;
	}
}

int TopAndPop(Stack S){
	if(!IsEmpty(S)){
		return S->Array[S->TopOfStack--];
	}
	printf("Empty stack");
	return 0;
}

int main(){
	Stack S;
	S = CreateStack(10);
	printf("IsEmpty %d \n",IsEmpty(S));
	int i;
	for(i = 0; i < 10;i++)
	{
		Push(i+1,S);
	}
	printf("IsFull %d\n",IsFull(S));
	printf("Top %d \n",Top(S));
	Pop(S);
	printf("Top after Pop %d\n",Top(S));
	printf("after PopAndTop %d\n",TopAndPop(S));
	printf("%d",Top(S));
	return 1;
}
