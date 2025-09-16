/*
    Name: 
        Wenbo Wu / Scout Wu

    Student ID: 
        24729742

    Compile: 
        gcc -Og ./24729742.c -o 24729742
        You can use -O2 or -O3 if you want.
    
    Usage:
        24729742 [File name];
*/

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
int TotalProcess = 0;
int ProcessCompleted = 0;


struct process
{
    char name;
    int TotalExecutionTime; // Time needed to complete in total
    int IoCallQuanta[10]; // Array of time quanta when io call occurs
    int TotalIOCallCount; // times of io call
    int IOCallMade; // IO call already made count
    int CurrentRunningTime; // current processed time for this process
    int CurrentRunningQuanta;
    bool Completed; // Flag variable indicate the program is done.

};


// Debug Function
void DisplayProcess(struct process P)
{   
    // only use for debug
    printf("Name:%c  ", P.name);
    printf("TotalExecutionTime: %d  ", P.TotalExecutionTime);
    printf("IO Quanta: ");
    for (int i = 0; i < MAXMIUM_IO_CALLS; i++) {
        printf("%d ", P.IoCallQuanta[i]);
    }
    printf("\n");
}


// File Read
struct process * readfile(char* FileName, struct process pi[])
{   
    // Return a pointer points to the structured array of structure process.
    FILE *InputFile;
    char LineBuffer[500] = "";

    // File Open Error
    InputFile = fopen(FileName,"r");
    if (InputFile == NULL)
    {
        printf("Error, File open failed\n");
        return NULL;
    }


    // File Read
    int PrsNo = 0;
    while (fgets(LineBuffer,500,InputFile))
    {
        int itemsRead = sscanf(LineBuffer, "%c %d %d %d %d %d %d %d %d %d %d %d",
                            &pi[PrsNo].name, &pi[PrsNo].TotalExecutionTime,
                            &pi[PrsNo].IoCallQuanta[0],&pi[PrsNo].IoCallQuanta[1],&pi[PrsNo].IoCallQuanta[2],
                            &pi[PrsNo].IoCallQuanta[3],&pi[PrsNo].IoCallQuanta[4],&pi[PrsNo].IoCallQuanta[5],
                            &pi[PrsNo].IoCallQuanta[6],&pi[PrsNo].IoCallQuanta[7],&pi[PrsNo].IoCallQuanta[8],
                            &pi[PrsNo].IoCallQuanta[9]);

        // Initialize
        if (itemsRead >= 2) // Name, Total ExecutionTime read successful
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
// Check if completed, Print the Result at the same time.
    if (Process->CurrentRunningTime >= Process->TotalExecutionTime && Process->Completed == false)
    {
        Process->Completed = true;
        printf("%c completed at time %d\n", 
        Process->name, TotalRunningTime);
        return true;
    }
    return false;
}


bool IOCallCheck(struct process *Process)
{
    int IoCallMade = Process -> IOCallMade;
    int CurrentRunningQuanta = Process -> CurrentRunningQuanta;
    int IoCallQuanta = Process -> IoCallQuanta[IoCallMade];

    return CurrentRunningQuanta == IoCallQuanta && IoCallQuanta != 0;
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
            if (IOCallCheck(&Process[i]))
            {   
                Process[i].CurrentRunningTime += IOREQUEST_MS;
                TotalRunningTime += IOREQUEST_MS;
                if (CompletionCheck(&Process[i]))
                {
                    Process[i].Completed = true;
                    ProcessCompleted ++;
                }
                Process[i].IOCallMade ++;
            }

            // if no io call
            else
            {   
                // Completion Check every 5 ms
                Process[i].CurrentRunningTime += IOREQUEST_MS;
                TotalRunningTime += IOREQUEST_MS;
                if (CompletionCheck(&Process[i]))
                    {
                        Process[i].Completed = true;
                        ProcessCompleted++;
                        continue;
                    }

                Process[i].CurrentRunningTime += IOREQUEST_MS;
                TotalRunningTime += IOREQUEST_MS;
                if (CompletionCheck(&Process[i]))
                    {
                        Process[i].Completed = true;
                        ProcessCompleted++;
                        continue;
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
    // Check if the usage is correct.
    if (argc != 2)
    {
        printf("Usage: 24729742 [Filename]\n");
        return 0;
    }


    char FileName[50];
    strcpy(FileName, argv[1]);
    //printf("File name: %s \n", FileName);


    struct process pr[10] = {0};
    struct process * p = pr;
    p = readfile(FileName,p);
    if (p == NULL)
    {
        printf("File Read Failed\n");
        return 0;
    }
    


    // Iterate through all the process until finish
    // every iteration is a quanta (10ms)
    ProcessSimu(p);
    return 0;
}