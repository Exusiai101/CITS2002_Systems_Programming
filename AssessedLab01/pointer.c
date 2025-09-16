#include <stdio.h>

int main(){
    char name[50]={"1 2 3 4 5"};

    printf("%x\n",name);// address points to the first element
    printf("%c\n",*name);//first element
    printf("%c\n", *(name+2)); // first element

}