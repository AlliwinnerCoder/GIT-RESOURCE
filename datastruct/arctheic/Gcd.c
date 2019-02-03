 #include<stdio.h>
 #include<stdlib.h>
 int Gcd(int M,int N){
 	int Rem;
 	while(N > 0){
 		Rem = M % N;
 		M = N;
 		N = Rem;
	 }
	 return M;
 }
 int main(){
	int M = 50,N = 15;
	printf("Value = %d",Gcd(M,N));
 }
