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


int main(){
	List L;
    L = malloc(sizeof(struct Node));
    Position node1 = malloc(sizeof(struct Node));
	Position node2 = malloc(sizeof(struct Node));
	Position node3 = malloc(sizeof(struct Node));
	Position node4 = malloc(sizeof(struct Node));
    L->Next = node1;
	node1->Element = 1;
	node1->Next = node2;
	node2->Element = 2;
	node2->Next = node3;
	node3->Element = 3;
	node3->Next = node4;
	node4->Element = 4;
	node4->Next = NULL;
	printf("%d\n",IsEmpty(L));
	printf("%d\n",IsLast(node2,L));
	Position P = Find(2,L);
	printf("%d\n",P->Next->Element);
	Position Pv = FindPrevious(2,L);
	printf("%d\n",Pv->Element);
	Delete(2,L);
	Position Pv1 = FindPrevious(3,L);
	printf("%d\n",Pv1->Element);
	Insert(5,L,node3);
	Position Pv2 = FindPrevious(4,L);
	printf("%d\n",Pv2->Element);
	DeleteList(L);
	printf("%d\n",IsEmpty(L));
	return 1;
}
