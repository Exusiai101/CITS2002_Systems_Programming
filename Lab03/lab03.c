#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void task1(){
        // Task 1 
        struct students
        {
            char name[50];
            int number;
        };
        const char ins[50]="Amy 2025";

        struct students student[5];

        for (int i = 0; i < 5; i++)
        {   char input[50] = "";
            scanf("%s %i", &student[i].name, &student[i].number);
        }
        for (int i = 0; i < 5; i++)
        {
            /* code */
            printf("name = %s, number = %i \n",student[i].name, student[i].number);
        }
    };

void task2()
    {
        // write at least 10 lines to a file
        FILE *fp;
        char myfile[1000];

        fp = fopen("myfile","w");
        int i = 0;
        while (i < 10)
        {
            scanf("%s", myfile);
            fprintf(fp,myfile);
            fprintf(fp,"\n");
            i++;
        }
        printf("My file is  = %s", myfile);
        
    }


void dangerous(){
    int a[5];
    int *b = malloc(sizeof(int));

    /*for (int i = 0; i < 6; i++)
    {
        a[i] = 100;
    }
    for (int i = 0; i < 10; i++)
    {
        printf("%i: %d\n",i, a[i]);
    }*/
}


int main()
{       
    dangerous();
    return 0;
}


/*int main()
{
    char name[5][10];
    
    for (int i = 0; i < 5; i++)
    {
        printf("Give me input:");
        scanf("%s", name[i]);
    }


    for (int i = 0; i < 5; i++)
    {
        printf("%s\n",name[i]);
    }
    
    return 0;
}*/