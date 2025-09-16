#include <stdio.h>
int main()
{
    long value;           // actual variable to store the value
    long *pointer = &value;  // pointer initialized to point to 'value'
    
    printf("Enter a number: ");
    scanf("%ld", &value);    // read directly into 'value'
    // or alternatively: scanf("%ld", pointer);
    
    printf("Address: %p\n", pointer);
    printf("Address of pointer: %p\n", &pointer);
    printf("Value at that address: %ld\n", *pointer);
    return 0;
}