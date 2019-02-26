#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"List.h"
#include"List.c"
void SwapList(Position position_ahead,Position position){
	
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
	return 0;
}
