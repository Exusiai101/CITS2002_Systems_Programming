#include <limits.h>
#include <stdio.h>
#include <stdlib.h>

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
        
        // Handle special cases: 11th, 12th, 13th
        if (current % 100 >= 11 && current % 100 <= 13)
        {
            printf("%dth\n", current);
        }
        else
        {
            int mod = current % 10;
            switch (mod)
            {
            case 1:
                printf("%dst\n", current);
                break;
            
            case 2:
                printf("%dnd\n", current);
                break;
            
            case 3:
                printf("%drd\n", current);
                break;

            default:
                printf("%dth\n", current);
                break;
            }
        }
    }
}

void star()
{
    int height = 5;
    
    // Upper part of the star (triangle)
    for (int i = 0; i < height; i++)
    {
        // Print spaces
        for (int j = 0; j < height - i - 1; j++)
        {
            printf(" ");
        }
        // Print stars
        for (int k = 0; k < 2 * i + 1; k++)
        {
            printf("*");
        }
        printf("\n");
    }
}

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf("Usage: %s <numbers>\n", argv[0]);
        return 1;
    }

    int Q1 = sum(argc, argv);
    int Q2 = find_max(argc, argv);
    
    printf("Sum: %d\n", Q1);
    printf("Max: %d\n", Q2);
    
    printf("\nOrdinal numbers:\n");
    ordinal(argc, argv);
    
    printf("\nStar pattern:\n");
    star();

    return 0;
}