#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdbool.h>
#include <string.h>

#define TIME_QUANTIUM 10
#define COMPLETION_QUANTA 10
#define IOREQUEST_MS 5
#define MAXMIUM_IO_CALLS 10

int TotalRunningTime = 0;
int TimeInAQuanta = 0; //everytime it reaches 10, means a quanta

struct process
{
    char name[50];
    int TotalExecutionTime;
    int IoCallQuanta[10];
    int CurrentRunningTime;
    bool Blocked;
    bool Ready;
    bool Running;
    bool Finished;

};

void DisplayProcess(struct process P)
{
    printf("Name:%s  ", P.name);
    printf("TotalExecutionTime: %d  ",P.TotalExecutionTime);
    printf("Io1: %d  ",P.IoCallQuanta[0]);
    printf("Io2: %d  ",P.IoCallQuanta[1]);
    printf("Io3: %d\n",P.IoCallQuanta[2]);
}

int Count_Digit(int num){
    if (num == 0) return 1;  // Special case for 0

    int count = 0;
    if (num < 0) num = -num;  // Handle negative numbers

    while (num > 0) {
        count++;
        num /= 10;
    }
    return count;
}


/*int io_request()
{

}*/

struct process * readfile(char* FileName, struct process ProcessInfo[])
{
    FILE *InputFile;
    char LineBuffer[500];

    InputFile = fopen(FileName,"r");
    if (InputFile == NULL)
    {
        printf("Error, File open failed\n");
        return NULL;
    }
    int PrsNo = 0;
    while (fgets(LineBuffer,500,InputFile))
    {
        int count=0;
        char *LinePtr = LineBuffer;
        char FormattedBuffer[50];

        // Read the name
        sscanf(LinePtr,"%s ", FormattedBuffer);
        strcpy(ProcessInfo[PrsNo].name, FormattedBuffer);
        LinePtr += strlen(ProcessInfo[PrsNo].name);

        // Read Processed Time
        sscanf(LinePtr," %d", &ProcessInfo[PrsNo].TotalExecutionTime);
        LinePtr += (Count_Digit(ProcessInfo[PrsNo].TotalExecutionTime) + 1);

        // Read IO time
        int IOCount = 0;
        while (*LinePtr != '\0')
        {
            sscanf(LinePtr," %d", &ProcessInfo[PrsNo].IoCallQuanta[IOCount]);
            LinePtr += (Count_Digit(ProcessInfo[PrsNo].IoCallQuanta[IOCount]) + 1);
            IOCount++;
        }
        PrsNo++;
    }
    return ProcessInfo;
}

int reading(){
    FILE *document = fopen("testinput.txt","r"); //A 90 3 5 6
    char line[50];
    char word[20];
    struct process status[10];
    int i = 0;
    while(fgets(line, sizeof line, document) != NULL){
        sscanf(line,"%s",status[i].name);
        int n = strlen(status[i].name) + 1;

        sscanf(line + n, "%d",&status[i].TotalExecutionTime);
        sprintf(word,"%d",status[i].TotalExecutionTime);
        int m = strlen(word) + 1;
        int move = 0;
        int l = 0;
        char qp[20];
        while(true){
            if(sscanf(line + n + m + move, "%d",&status[i].IoCallQuanta[l]) == 1){
                sprintf(qp,"%d",status[i].IoCallQuanta[l]);
                move = move + strlen(qp)+1;
            }
            else{break;}
            l = l + 1;

        }
        i = i + 1;
    }
    return 0;
}
int main() {
    reading();
}

/*int main(int argc, char* argv[])
{
    struct process * p;
    struct process ProcessInfo[10];
    p = readfile("testinput.txt",ProcessInfo);

    if (p == NULL)
    {
        printf("File Read Failed\n");
    }
    else
    {
        for (int i = 0; i < 10; i++)
        {
            DisplayProcess(*(p+i));
        }
    }


    // Iterate through all the process until finish
    // every iteration is 1ms
    while (true)
    {
        break;
    }
    return 0;
}*/