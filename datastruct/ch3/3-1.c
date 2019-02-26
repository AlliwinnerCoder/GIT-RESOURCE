#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "List.h"
#include "List.c"

void PrintList(List L){
	if(L == NULL || L->Next == NULL){
		printf("List is NULL");
	}
	
	L = L->Next;
	
	do{
		printf("%d \n",L->Element);
		L = L->Next;
	}while(L);
}

int main(){
	List L;
	L = malloc(sizeof(struct Node));
	L->Next = NULL;
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
	PrintList(L);
 	return 0;
 }
