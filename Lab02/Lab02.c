#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>
#include <limits.h>



int sum(int argc, char *argv[])
{
    int result = 0;
    for (int i = 1; i < argc; i++)
    {
        result += atoi(argv[i]);
    }
    return result;
}

int find_max(int argc, char *argv[])
{
    int max = INT_MIN;
    for (int i = 1; i < argc; i++)
    {   
        int current = atoi(argv[i]);

        if (current == INT_MAX)
        {
            return INT_MAX;
        }
        else if (current > max)
        {
            max = current;
        }
        
    }
    return max;
}

void ordinal(int argc, char *argv[])
{
    for (int i = 1; i < argc; i++)
    {
        int current = atoi(argv[i]);
        
        int mod = current%10;

        switch (mod)
        {
        case 1:
            printf("%ist\n",current);
            break;
        
        case 2:
            printf("%ind\n",current);
            break;
        
        case 3:
            printf("%ird\n",current);
            break;

        default:
            printf("%ith\n",current);
            break;
        }
    }
    
}

void star()
{
    int length = 5;
    int hight = 5;
    for (int i = 0; i < hight; i++)
    {
        for (int j = 0; j < hight-1; j++)
        {
            printf(" ");
        }
        for (int k = 0; k < 5-hight; k++)
        {
            printf("*\n");
        }
        
        
    }
    
}

int main(int argc, char *argv[])
{
    /*for(int i=1;i<argc;i++)
    {
        printf("%i\n", atoi(argv[i]));
    }*/
    if (argc < 2)
    {
        return 0;
    }


    int Q1 = sum(argc, argv);
    int Q2 = find_max(argc, argv);
}