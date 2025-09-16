#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
/*int main(){
    char input[50] = "Abcde 90 3 4 5 ";
    char name[50];
    int number[10];
    sscanf(input,"%s ", name);
    printf("size:%d\n", strlen(name));
    printf("name: %s\n", name);
    char *pointer = input;

    sscanf(pointer+strlen(name)+1, "%d ", &number[0]);

    char NumStrBuffer[50];
    sprintf(NumStrBuffer, "%d", number[0]);// Calculate the length of int
    printf("NUmber1: %d", strlen(NumStrBuffer));
}*/

int main(){
    int a = 3;
    printf("%u", a);
}