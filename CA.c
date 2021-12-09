#include <stdio.h> 
#include <string.h>
#include <stdlib.h>
#include "Cell_def.h"
#include "Cell.h"
#include "timer.h"


#define columns 200
#define rows 200

double start, finish, elapsed;
int totalDeath; 
int totalRecovered; 
int totalInfected; 
Cell board[columns][rows];


int main(){ 
    int generation = 0;
    GET_TIME(start);
    init_board();
    
    
  
    // savePrevious();
    int previousDeath , previousRecovered , previousInfected; 
    for(int i= 0; i < 1000; i ++){
        generate();
        generation += 1;
        //  printf("generation = %d\n",generation);
        // printf("totalDeath = %d , previousDEath =%d\n ", totalDeath, previousDeath);
        // printf("totalRecovered = %d, , previousRecovered =%d\n", totalRecovered, previousRecovered);
        // printf("totalInfected = %d, , previousInfected =%d\n", totalInfected , totalInfected);
        if(previousDeath == totalDeath && previousRecovered == totalRecovered && previousInfected == totalInfected)
            break; 
        previousDeath = totalDeath; 
        previousRecovered = totalRecovered; 
        previousInfected = totalInfected;
        
    }
    GET_TIME(finish);

    elapsed = finish- start; 
    printf("Elapsed time = %e seconds \n", elapsed);
    printf("generation = %d\n",generation);
    printf("totalDeath = %d\n", totalDeath);
    printf("totalRecovered = %d\n", totalRecovered);
    printf("totalInfected = %d\n", totalInfected);

    return 0; 
}

//tia 



