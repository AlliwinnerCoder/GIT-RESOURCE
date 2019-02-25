#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include "Stack.h"
#define NUM 100

struct Node{
	int Element;
	PtrToNode Next;
};

int IsEmpty(Stack S){
	return S->Next == NULL;
}

Stack CreateStack(void){
	Stack S;
	S = malloc(sizeof(struct Node));
	if(S == NULL){
		printf("Out of space !!!");
	}
	S->Next = NULL;
	MakeEmpty(S);
	return S;
}

void MakeEmpty(Stack S){
	if(S ==NULL){
		printf("Must use CreateStack first");
	}else{
		while(!IsEmpty(S)){
			Pop(S);
		}
	}
}

void Push(int X,Stack S){
	PtrToNode TmpCell;
	TmpCell = malloc(sizeof(struct Node));
	if(TmpCell == NULL){
		printf("Out of space !!!");
	}else{
		TmpCell->Element = X;
		TmpCell->Next = S->Next;
		S->Next = TmpCell;
	}
}

int Top(Stack S){
	if(!IsEmpty(S)){
		return S->Next->Element;
	}
	printf("Empty stack");
	return -1;
}

void Pop(Stack S){
	PtrToNode FirstCell;
	
	if(IsEmpty(S)){
		printf("Empty stack");
	}else{
		FirstCell = S->Next;
		S->Next = S->Next->Next;
		free(FirstCell);	
	}
}

int main(){
	Stack S;
	S = CreateStack();
	printf("IsEmpty %d\n",IsEmpty(S));
	int i;
	for(i = 0; i < NUM; i++)
	{
		Push(i+1,S);
	}
	printf("Create Successful IsEmpty %d\n",IsEmpty(S));
	printf("Top Element %d\n",Top(S));
	Pop(S);
	printf("Top Element after Pop %d\n",Top(S));
	MakeEmpty(S);
	printf("IsEmpty after MakeEmpty %d\n",IsEmpty(S));
	return 0;
	return 1;
}
