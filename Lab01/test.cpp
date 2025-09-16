#include <stdio.h>

int main(){
    int i = 65536 * 16384;
    int initial = i;
    while (initial <= i)
    {
        printf("%d\n",i);
        i++;
        /* code */
    }
    return 0;    
}