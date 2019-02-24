#include 'Queue.h'
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
		Q->Rear = Succ(Q->rear,Q);
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

 

int main(){
	return 1;
}
