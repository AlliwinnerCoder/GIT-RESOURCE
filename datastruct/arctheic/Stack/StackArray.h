struct StackRecord;
typedef struct StackRecord *Stack;

int IsEmpty(Stack S);
int IsFull(Stack S);
Stack CreateStack(int MaxElements);
void DisposeStack(Stack S);
void MakeEmpty(Stack S);
void Push(int X,Stack S);
int Top(Stack S);
void Pop(Stack S);
int ToAndPop(Stack S);
