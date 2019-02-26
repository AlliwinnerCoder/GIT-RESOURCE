#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "List.h"
struct Node
{
	int Element;
	Position Next;
};

int IsEmpty(List L){
	return L->Next == NULL;
}

int IsLast(Position P,List L){
	return P->Next == NULL;
}

Position Find(int X,List L){
	Position P;
	P = L->Next;
	while( P != NULL && P->Element != X){
		P = P->Next;
	}
	
	return P;
}

Position FindPrevious(int X,List L){
	Position P;
    P = L;
    while(P->Next != NULL && P->Next->Element != X){
    	P = P->Next;
	}
	
	return P;
}

void Delete(int X,List L){
    Position P,TmpCell;
    P = FindPrevious(X,L);
    
    if(!IsLast(P,L)){
    	TmpCell = P->Next;
    	P->Next = TmpCell->Next;
    	if(TmpCell != NULL){
    		free(TmpCell);
		}	
	}
}

void DeleteList(List L)
{
	Position P,Tmp;
	
	P = L->Next;
	L -> Next = NULL;
	while(P != NULL)
	{
		Tmp = P -> Next;
		free(P);
		P = Tmp;
	}
}

void Insert(int X,List L,Position P){
	Position TmpCell;
	TmpCell = malloc(sizeof(struct Node));
	if(TmpCell == NULL){
		printf("Out of Space !!!!");
	}
	TmpCell->Element = X;
	TmpCell->Next = P->Next;
	P->Next = TmpCell;
}

