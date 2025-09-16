#include <stdio.h>
#include <stdlib.h>

#include<unistd.h>
FILE* lsadkj; 
int main() {
    printf("Before exec\n");
    execl("/bin/ls", "ls", "-l", NULL);
    printf("After exec\n");
    return 0;
    fopen();
}

