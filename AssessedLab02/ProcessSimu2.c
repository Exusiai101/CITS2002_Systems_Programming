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
        Example:
            ./24729742 sampleinput.txt

*/

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>


#define TIME_QUANTUM 10
#define COMPLETION_QUANTA 10
#define IOREQUEST_MS 5
#define MAXIMUM_IO_CALLS 10
#define MAX_PROCESS_NUM 10

int* TotalRunningTime = NULL;
int* TotalProcess = NULL;
int* ProcessCompleted = NULL;


struct process
{
    char* name;
    int TotalExecutionTime; // Time needed to complete in total
    int* IOCallQuanta; // Array of time quanta when io call occurs
    int* IOCallStep; // Array of time step in each quantum
    int TotalIOCallCount; // times of io call
    int IOCallMade; // IO call already made count
    int CurrentRunningTime; // current processed time for this process
    int CurrentRunningQuanta;
    bool Completed; // Flag variable indicate the program is done.
};

struct Process_Node // use linked list for dynamic memory allocation
{
    struct Process_Node* previous; // points to the previous node
    // init to NULL, if previous == NULL, it is the first node

    struct process* data; // data in current node

    struct Process_Node* next; // points to the next node
    // init to NULL, if next == NULL, it is the last node
};

struct Process_Node* CreateProcess_Node()
{
    // Create a node and initialize
    struct Process_Node* newNode = (struct Process_Node*)malloc(sizeof(struct Process_Node));
    if (newNode == NULL)
    {
        printf("Process_Node allocation failed\n");
        return NULL;
    }
    newNode->previous = NULL;
    newNode->data = (struct process*)calloc(1, sizeof(struct process));
    newNode->next = NULL;
    return newNode;
}

struct Process_Node* Process_append(struct Process_Node* current, struct Process_Node* next)
{
    if (current != NULL && next != NULL)
    {
        current->next = next;
        next->previous = current;
        return current;
    }
    return current;
}
void Free_All_Process_Node(struct Process_Node* current) {
  if (current -> next != NULL) {
    Free_All_Process_Node(current->next);
  }
  free(current -> data);
  free(current);
}

// Debug Function
void DisplayProcess(const struct Process_Node* p)
{
    // Print Process details for debugging
    while (p != NULL)
    {
        struct process* ProcessInfo = p->data;
        printf("Previous Node Address: %p\n", p->previous);
        printf("Name:%s  ", ProcessInfo->name);
        printf("TotalExecutionTime: %d  ", ProcessInfo->TotalExecutionTime);
        printf("IO Call: ");
        for (int i = 0; i < p->data->TotalIOCallCount; i++)
        {
            printf("%d ", ProcessInfo->IOCallQuanta[i]);
            printf("%d |", ProcessInfo->IOCallStep[i]);
        }
        printf("Next Node Address: %p\n", p->next);
        printf("\n");
        p = p->next;
    }
}


// File Read
struct Process_Node* readfile(const char* FileName, struct Process_Node* node)
{
    // Return the address of the first node.

    // File Open Error
    FILE* InputFile = fopen(FileName, "r");
    if (InputFile == NULL)
    {
        printf("Error, File open failed\n");
        return NULL;
    }

    struct Process_Node* first = node;
    struct Process_Node* current = first;

    // Read lines from file and put them into the elements in structure array.
    char LineBuffer[1000] = {0};

    int* PrsNo = (int*)calloc(1,sizeof(int));

    while (fgets(LineBuffer, 1000, InputFile))
    {

        char nameBuffer[1000] = {0};
        int quantaBuffer[10] = {0};
        int stepBuffer[10] = {0};

        struct process* pi = calloc(1, sizeof(struct process));
        if (pi == NULL)
        {
            printf("Process_Node allocation failed\n");
            return NULL;
        }
        current->data = pi;

        int itemsRead = sscanf(LineBuffer, "%s %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d",
                               nameBuffer, &pi->TotalExecutionTime,
                               &quantaBuffer[0], &stepBuffer[0],&quantaBuffer[1],&stepBuffer[1],
                               &quantaBuffer[2],&stepBuffer[2],&quantaBuffer[3],&stepBuffer[3],
                               &quantaBuffer[4],&stepBuffer[4],&quantaBuffer[5],&stepBuffer[5],
                               &quantaBuffer[6],&stepBuffer[6],&quantaBuffer[7],&stepBuffer[7],
                               &quantaBuffer[8],&stepBuffer[8],&quantaBuffer[9],&stepBuffer[9]);
        pi->name = calloc(1, sizeof(char) * strlen(nameBuffer) + 1);
        strcpy(pi->name, nameBuffer);


        if (itemsRead >= 2) // Name, Total ExecutionTime read successful
        {

            int totalIOCallCount = (itemsRead - 2) / 2;
            // Initialize to proper values. All to 0 expect Total IO Call Count
            pi->TotalIOCallCount = totalIOCallCount;

            // initialize array
            current -> data -> IOCallQuanta = calloc(totalIOCallCount, sizeof(int));
            current -> data -> IOCallStep = calloc(totalIOCallCount, sizeof(int));
            // Copy the data from buffer to data
            for (int i = 0; i < totalIOCallCount; i++)
            {
                current -> data -> IOCallQuanta[i] = quantaBuffer[i];
                current -> data -> IOCallStep[i] = stepBuffer[i];
            }
            pi->CurrentRunningTime = 0;
            pi->CurrentRunningQuanta = 0;
            pi->Completed = false;
            pi->IOCallMade = 0;
            *PrsNo = (*PrsNo)++;
        }

        // move to the next node
        struct Process_Node* newNode = CreateProcess_Node();
        if (newNode == NULL)
        {
            printf("Process_Node allocation failed\n");
            return NULL;
        }
        Process_append(current, newNode);
        current = newNode;

        *PrsNo = (*PrsNo)+1;
    }

    *TotalProcess = (*PrsNo);

    fclose(InputFile);
    free(PrsNo);

    current->previous->next = NULL; // remove the last node
    free(current->data);            // Because there will be an extra empty node
    free(current);
    return first;
}


bool CompletionCheck(struct process* Process)
{
    // Check if completed, Print the Result at the same time.
    if (Process->CurrentRunningTime >= Process->TotalExecutionTime && Process->Completed == false)
    {
        Process->Completed = true;
        printf("%s completed at time %d\n",
               Process->name, *TotalRunningTime);
        return true;
    }
    return false;
}


bool IOCallCheck(const struct process* Process)
{
    if (Process != NULL)
    {
        int IoCallMade = Process->IOCallMade;
        int CurrentRunningQuanta = Process->CurrentRunningQuanta;
        int IoCallQuanta = Process->IOCallQuanta[IoCallMade];
        return CurrentRunningQuanta == IoCallQuanta && IoCallQuanta != 0;
    }
    return false;

}

// Process Simulation starts here
void ProcessSimu(struct Process_Node* Process)
{
    struct Process_Node* first = Process;
    struct Process_Node* current = first;
    while (*ProcessCompleted < *TotalProcess)
    {
        if (current -> data -> Completed != true)
        {
            current -> data->CurrentRunningQuanta++;
            // if io call happens
            if (IOCallCheck(current -> data))
            {
                current -> data -> CurrentRunningTime += current -> data -> IOCallStep[current -> data -> IOCallMade];
                *TotalRunningTime += current -> data -> IOCallStep[current -> data -> IOCallMade];
                if (CompletionCheck(current -> data))
                {
                    current -> data -> Completed = true;
                    *ProcessCompleted = (*ProcessCompleted) + 1;
                    // printf("ProcessCompleted was incremented to %d\n",*ProcessCompleted);
                }

                // printf("%s made an IO call at %d\n", current ->data->name, current -> data -> IOCallQuanta[current -> data -> IOCallMade]);
                current -> data -> IOCallMade++;
            }

            // if no io call
            else
            {
                // Complection Check every 1 ms
                for (int i=0; i < TIME_QUANTUM; i++)
                {
                    current -> data -> CurrentRunningTime ++;
                    (*TotalRunningTime)++;
                    if (CompletionCheck(current -> data))
                    {
                        current -> data -> Completed = true;
                        *ProcessCompleted = (*ProcessCompleted)+1;
                        // printf("ProcessCompleted was incremented to %d\n",*ProcessCompleted);
                        break;
                    }
                }
            }
        }

        // Points to the next node and
        if (current->next == NULL)
        {
            current = first;
            continue;
        }
        else
        {
            current = current->next;
        }
    }
}


int main(int argc, char* argv[])
{
    // Check if the usage is correct.
    if (argc != 2)
    {
        printf("Usage: 24729742 [Filename]\n");
        return 0;
    }

    TotalRunningTime = (int*)calloc(1, sizeof(int));
    TotalProcess = (int*)calloc(1, sizeof(int));
    ProcessCompleted = (int*)calloc(1, sizeof(int));

    if (TotalRunningTime == NULL || TotalProcess == NULL || ProcessCompleted == NULL)
    {
        printf("Memory allocation failed\n");
        return 0;
    }
    // printf("ProcessCompleted:%d\n", *ProcessCompleted);

    char* FileName = malloc(sizeof(argv[1]));
    strcpy(FileName, argv[1]);
    //printf("File name: %s \n", FileName);


    struct Process_Node* node0 = CreateProcess_Node();
    if (node0 == NULL)
    {
        printf("Memory allocation failed\n");
        free(FileName);
        return 0;
    }
    node0->previous = NULL;
    node0 = readfile(FileName, node0);
    if (node0 == NULL)
    {
        printf("File Read Failed\n");
        free(FileName);
        Free_All_Process_Node(node0);
        return 0;
    }
    free(FileName);

    // DisplayProcess(node0);
    // printf("TotalProcess:%d\n", *TotalProcess);

    // Iterate through all the process until finish
    // every iteration is a quanta (10ms)
    ProcessSimu(node0);
    Free_All_Process_Node(node0);
    return 0;
}
