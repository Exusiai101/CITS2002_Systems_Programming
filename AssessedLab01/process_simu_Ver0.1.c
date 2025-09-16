#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdbool.h>
#include <string.h>

#define TIME_QUANTIUM 10
#define COMPLETION_QUANTA 10
#define IOREQUEST_MS 5
#define MAXMIUM_IO_CALLS 10
#define MAX_PROCESS_NUM 10

int TotalRunningTime = 0;
int TimeInAQuanta = 0; //everytime it reaches 10, means a quanta
int TotalProcess = 0;
int ProcessCompleted = 0;

struct process
{
    char name[50];
    int TotalExecutionTime; // Time needed to complete in total
    int IoCallQuanta[10]; // Array of time quanta when io call occurs
    int TotalIOCallCount; // times of io call
    int IOCallMade; // IO call already made count
    int CurrentRunningTime; // current processed time for this process
    int CurrentRunningQuanta;
    bool Completed; // Flag variable indicate the program is done.

};

struct process * InitProcessArray(struct process *pr)
{
    for (int i = 0; i < MAX_PROCESS_NUM; i++)
    {
        strcpy(pr[i].name,"");
        pr[i].TotalExecutionTime = 0;
        for (int j = 0; j < 10; j++)
        {
            pr[i].IoCallQuanta[j] = 0;
        }
        pr[i].TotalIOCallCount = 0;
        pr[i].IOCallMade = 0;
        pr[i].CurrentRunningTime = 0;
        pr[i].CurrentRunningQuanta = 0;
        pr[i].Completed = false;
    }
    return pr;
}

// Debug Function
void DisplayProcess(struct process P)
{   
    // only use for debug
    printf("Name:%s  ", P.name);
    printf("TotalExecutionTime: %d  ", P.TotalExecutionTime);
    printf("IO Quanta: ");
    for (int i = 0; i < MAXMIUM_IO_CALLS; i++) {
        printf("%d ", P.IoCallQuanta[i]);
    }
    printf("\n");
}

// A helper function used to count the digit and move the pointers
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

// File Read
struct process * readfile(char* FileName, struct process pi[])
{   
    // Return a pointer points to the structured array of structure process.
    FILE *InputFile;
    char LineBuffer[500] = "";

    InputFile = fopen(FileName,"r");
    if (InputFile == NULL)
    {
        printf("Error, File open failed\n");
        return NULL;
    }
    int PrsNo = 0;
    while (fgets(LineBuffer,500,InputFile))
    {
        /*
        // Read the name
        sscanf(LinePtr,"%s ", FormattedBuffer);
        strcpy(pi[PrsNo].name, FormattedBuffer);
        LinePtr += strlen(pi[PrsNo].name);
        
        // Read Processed Time
        sscanf(LinePtr," %d", &pi[PrsNo].TotalExecutionTime);
        LinePtr += (Count_Digit(pi[PrsNo].TotalExecutionTime) + 1);

        // Read IO time
        int IOCount = 0;
        while (*LinePtr != '\0')
        {   
            sscanf(LinePtr," %d", &pi[PrsNo].IoCallQuanta[IOCount]);
            LinePtr += (Count_Digit(pi[PrsNo].IoCallQuanta[IOCount]) + 1);
            IOCount++;
        } */
        int itemsRead = sscanf(LineBuffer, "%s %d %d %d %d %d %d %d %d %d %d %d",
                                &pi[PrsNo].name, &pi[PrsNo].TotalExecutionTime,
                                &pi[PrsNo].IoCallQuanta[0],&pi[PrsNo].IoCallQuanta[1],&pi[PrsNo].IoCallQuanta[2],
                                &pi[PrsNo].IoCallQuanta[3],&pi[PrsNo].IoCallQuanta[4],&pi[PrsNo].IoCallQuanta[5],
                                &pi[PrsNo].IoCallQuanta[6],&pi[PrsNo].IoCallQuanta[7],&pi[PrsNo].IoCallQuanta[8],
                                &pi[PrsNo].IoCallQuanta[9]);

        // Initialize
        if (itemsRead >= 2) // Name, Total ExecutionTime, Total IOCallCount was sucessfully read
        {
            pi[PrsNo].TotalIOCallCount = itemsRead - 2;
            pi[PrsNo].CurrentRunningTime = 0;
            pi[PrsNo].CurrentRunningQuanta = 0;
            pi[PrsNo].Completed = false;
            pi[PrsNo].IOCallMade = 0;
            PrsNo++;
        }
        
        
    }
    TotalProcess = PrsNo;
    pi[PrsNo - 1].TotalIOCallCount+=1;
    fclose(InputFile);
    return pi;
}


bool CompletionCheck(struct process *Process)
{
// Check if completed
    if (Process->CurrentRunningTime >= Process->TotalExecutionTime && Process->Completed == false)
    {
        Process->Completed = true;

        printf("ProcessName: %s, GlobalTime: %d \n", 
        Process->name, TotalRunningTime);
        return true;
    }
    return false;
}

// Process Simulation starts here
struct process * ProcessSimu(struct process Process[])
{
    int i = 0;
    while (ProcessCompleted < TotalProcess)
    {   
        // each loop is a time quanta (10ms)
        if (Process[i].Completed != true)
        {   
            Process[i].CurrentRunningQuanta++;
            // if iocall happens
            if (Process[i].CurrentRunningQuanta == 
                Process[i].IoCallQuanta[ Process[i].IOCallMade]  &&
                Process[i].IoCallQuanta[Process[i].IOCallMade] != 0)
            {
                //Process[i].CurrentRunningQuanta++;

                /*
                Process[i].CurrentRunningTime += IOREQUEST_MS;
                Process[i].IOCallMade++;
                TotalRunningTime += IOREQUEST_MS;
                if (CompletionCheck(&Process[i]))
                {
                    ProcessCompleted++;
                };
                */

                for (int j = 0 ; j < 5; j++)
                {
                    Process[i].CurrentRunningTime++;
                    TotalRunningTime++;
                    if (CompletionCheck(&Process[i]))
                    {
                        Process[i].Completed = true;
                        ProcessCompleted++;
                        break;
                    }
                }
                Process[i].IOCallMade++;

            }

            // if no io call
            else
            {
                //Process[i].CurrentRunningQuanta++;
                //Process[i].CurrentRunningTime += TIME_QUANTIUM;
                /*
                TotalRunningTime += TIME_QUANTIUM;
                CompletionCheck(Process, i);
                */

                /*
                TotalRunningTime += IOREQUEST_MS;
                if(CompletionCheck(&Process[i]))
                {
                    ProcessCompleted++;
                    i = (i+1) % TotalProcess;
                    continue;
                };
                TotalRunningTime += IOREQUEST_MS;
                if (CompletionCheck(&Process[i]))
                {
                    ProcessCompleted++;
                    i = (i+1) % TotalProcess;
                    continue;
                };
                */

                for (int j = 0; j < 10; j++)
                {
                    Process[i].CurrentRunningTime ++;
                    TotalRunningTime ++;
                    if (CompletionCheck(&Process[i]))
                    {
                        Process[i].Completed = true;
                        ProcessCompleted++;
                        break;
                    }
                }
            }
            
        }
        // Increment loop variable
        i = (i+1) % TotalProcess;    
    }
    return NULL;    
}
    

int main(int argc, char* argv[])
{   
    struct process * p;
    struct process pr[10];
    struct process *ProcessInfo = pr;
    ProcessInfo = InitProcessArray(pr);
    p = readfile("sampleinput1.txt",ProcessInfo);
    
    if (p == NULL)
    {
        printf("File Read Failed\n");
        return 0;
    }
    else
    {   printf("TotalProcess %d\n",TotalProcess);
        for (int i = 0; i < TotalProcess; i++)
        {
            DisplayProcess(*(p+i));
        }
    }
    
    // Iterate through all the process until finish
    // every iteration is a quanta (10ms)
    ProcessSimu(p);
    return 0;
}
