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
    int IOCallMade; // IO call already made count - NOT NEEDED
    int CurrentRunningTime; // current processed time for this process
    int CurrentRunningQuanta;
    int CpuTime; // NOT NEEDED
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
        pr[i].CpuTime = 0;
        pr[i].Completed = false;
    }
    return pr;
}

// Debug Function
void DisplayProcess(struct process P)
{   
    printf("Name:%s  ", P.name);
    printf("TotalExecutionTime: %d  ", P.TotalExecutionTime);
    printf("IO Quanta: ");
    for (int i = 0; i < MAXMIUM_IO_CALLS; i++) {
        printf("%d ", P.IoCallQuanta[i]);
    }
    printf("\n");
}

// File Read - CORRECTED
struct process * readfile(char* FileName, struct process pi[])
{   
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
        int itemsRead = sscanf(LineBuffer, "%s %d %d %d %d %d %d %d %d %d %d %d",
                                pi[PrsNo].name, &pi[PrsNo].TotalExecutionTime,
                                &pi[PrsNo].IoCallQuanta[0],&pi[PrsNo].IoCallQuanta[1],&pi[PrsNo].IoCallQuanta[2],
                                &pi[PrsNo].IoCallQuanta[3],&pi[PrsNo].IoCallQuanta[4],&pi[PrsNo].IoCallQuanta[5],
                                &pi[PrsNo].IoCallQuanta[6],&pi[PrsNo].IoCallQuanta[7],&pi[PrsNo].IoCallQuanta[8],
                                &pi[PrsNo].IoCallQuanta[9]);

        // Initialize
        if (itemsRead >= 2) // Name and Total ExecutionTime were successfully read
        {
            pi[PrsNo].TotalIOCallCount = itemsRead - 2;
            pi[PrsNo].CurrentRunningTime = 0;
            pi[PrsNo].CurrentRunningQuanta = 0;
            pi[PrsNo].Completed = false;
            pi[PrsNo].IOCallMade = 0;
            pi[PrsNo].CpuTime = 0;
            PrsNo++;
        }
    }
    TotalProcess = PrsNo;
    // REMOVED THE BUGGY LINE: pi[PrsNo - 1].TotalIOCallCount+=1;
    fclose(InputFile);
    return pi;
}

// CORRECTED Process Simulation
struct process * ProcessSimu(struct process Process[])
{   
    int i = 0;
    while (ProcessCompleted < TotalProcess)
    {
        // Process the current process if it's not completed
        if (!Process[i].Completed)
        {
            // Increment the quantum count for this process
            Process[i].CurrentRunningQuanta++;
            
            // Check if this quantum has an I/O call
            bool hasIOCall = false;
            for (int j = 0; j < Process[i].TotalIOCallCount; j++)
            {
                if (Process[i].CurrentRunningQuanta == Process[i].IoCallQuanta[j])
                {
                    hasIOCall = true;
                    break;
                }
            }
            
            if (hasIOCall)
            {
                // Process runs for 5ms then makes I/O request and blocks
                Process[i].CurrentRunningTime += IOREQUEST_MS;
                TotalRunningTime += IOREQUEST_MS;
            }
            else
            {
                // Process runs for full time quantum
                Process[i].CurrentRunningTime += TIME_QUANTIUM;
                TotalRunningTime += TIME_QUANTIUM;
            }
            
            // Check if process has completed
            if (Process[i].CurrentRunningTime >= Process[i].TotalExecutionTime)
            {
                Process[i].Completed = true;
                ProcessCompleted++;
                printf("%s completed at time %d\n", Process[i].name, TotalRunningTime);
            }
        }
        
        // Move to next process (round-robin)
        i = (i + 1) % TotalProcess;
    }
    return Process;
}

int main(int argc, char* argv[])
{   
    struct process * p;
    struct process pr[10];
    struct process *ProcessInfo = pr;
    
    ProcessInfo = InitProcessArray(pr);
    
    // Change the filename to your input file
    p = readfile("sampleinput1.txt", ProcessInfo);
    
    if (p == NULL)
    {
        printf("File Read Failed\n");
    }
    else
    {   
        // Debug output
        printf("Total Processes: %d\n", TotalProcess);
        for (int i = 0; i < TotalProcess; i++)
        {
            DisplayProcess(*(p+i));
        }
        printf("\n");
    }
    
    // Run the simulation
    ProcessSimu(p);
    return 0;
}