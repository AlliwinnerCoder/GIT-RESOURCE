#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int printDigit(int a){
	printf("%d",a);
} 

void printInt(int N){
	if(N > 10)
		printInt(N/10);
	printDigit(N - (int)(N / 10) * 10);
}

void printOut(double N,int accuracy)
{
    if(N<0)
    {
        putchar('-');
        N=-N;
    }
    int n=(int)N;
    printInt(n);
    double decimal=N-n;
    if(decimal>0)
    {
        putchar('.');
    double add=0.5;
    int i;
    for(i=0;i<accuracy;i++)
    {
        add/=10;
    }
    N+=add;
    for(i=0;i<accuracy;i++)
    {
        decimal*=10;
    }
    printInt(decimal);
   }
}
int main()
{
    printOut(1263.15087,3);
    return 0;
}
