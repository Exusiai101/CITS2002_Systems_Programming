#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
    struct mystruct
    {
        char name[20];
        int student_number;
    };

    typedef struct mystruct Student;
    
    Student Blyat[2];
    
    strcpy(Blyat[0].name, "Cyka"); 
    Blyat[0].student_number = 114514;

    printf("name: %s, number: %d", Blyat[0].name, Blyat[0].student_number);
}