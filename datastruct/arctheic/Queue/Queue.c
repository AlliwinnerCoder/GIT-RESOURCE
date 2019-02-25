#include "Queue.h"
#include<stdlib.h>
#include<stdio.h>

struct QueueRecord{
	int Capacity;
	int Front;
	int Rear;
	int Size;
	int *Array;
};

Queue CreateQueue(int MaxElements){
	Queue Q;
	Q = malloc(sizeof(struct QueueRecord));
	Q -> Array = malloc(sizeof(int) * MaxElements);
	if(Q->Array == NULL){
		printf("Array Create Fail");
	}
	
	Q->Capacity = MaxElements;
	return Q;
}

static int Succ(int Value,Queue Q){
	if(++Value == Q->Capacity){
		Value = 0;
	}
	
	return Value;
}

int IsEmpty(Queue Q){
	return Q->Size == 0;
}

void MakeEmpty(Queue Q){
	Q->Size = 0;
	Q->Front = 1;
	Q->Rear = 0;
}

int IsFull(Queue Q){
	return Q->Size == Q->Capacity;
}

void Enqueue(int X,Queue Q){
	if(IsFull(Q)){
		printf("Full Queue");
	}else{
		Q->Size ++;
		Q->Rear = Succ(Q->Rear,Q);
		Q->Array[Q->Rear] = X;
	}
}

int Front(Queue Q){
	if(Q == NULL){
		printf("Q is Fail");
	}
	
	int Result = Q->Array[Q->Front];
	
	return Result;
}

void DisposeQueue(Queue Q){
	if(Q == NULL){
		printf("Q is already Dispose");
	}
	Q->Size = 0;
	Q->Front = 1;
	Q->Rear = 0;
	Q->Capacity = 0;
	free(Q->Array);
	free(Q);
}

void Dequeue(Queue Q){
	if(Q->Rear == (Q->Front - 1)){
		printf("The Queue is Empty");
	}
	
	if(Q->Front < Q->Capacity - 1){
		Q->Front += 1;
	}
	
	if(Q->Front == Q->Capacity){
		Q->Front = 0;
	}
}

int FrontAndDequeue(Queue Q){
	if(Q->Rear == (Q->Front - 1)){
		printf("The Queue is Empty");
	}
	
	int Result;
	
	if(Q->Front < Q->Capacity - 1){
		Q->Front += 1;
	}
	
	if(Q->Front == Q->Capacity){
		Q->Front = 0;
	}
	
	return Result;
}

int main(){
	Queue Q;
	Q = CreateQueue(10);
	MakeEmpty(Q);
	printf("IsEmpty %d\n",IsEmpty(Q));
	int i = 0;
	for(i = 0;i < 10;i++)
	{
	    Enqueue(i+1,Q);
	}
	printf("IsEmpty %d\n",IsEmpty(Q));
	printf("IsFull %d\n",IsFull(Q));
	printf("%d",Q->Size);
	return 0;
}
