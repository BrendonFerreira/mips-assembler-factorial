#include<stdio.h>

int fat(num){
  if( num <= 0 ){
    return 1;
  }
  else {
    return num * fat(num-1);
  }
}


int main(int argc, char const *argv[]){
  int result = fat(5);
  printf("%d\n", result);
  return 0;
}


/* Acumular a parte fracionaria
/ Recursivo
/ 1  / (!n)
/ EULER NUMBER E
/ Descobrir o valor de E
*/
