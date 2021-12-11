#include <stdio.h> 
#include <stdlib.h>
#include "Cell_def.h"
#include "Cell.h"

#define columns 200
#define rows 200

Cell board[columns][rows];
int totalDeath; 
int totalRecovered; 
int totalInfected; 

void generate(){ 

     for(int i=0 ; i< columns ; i++){
        for(int j=0 ; j<rows ; j++){
            board[i][j].previous = board[i][j].state; 
        }
    }
    
    
    for (int x = 0; x < columns; x++) {
        for (int y = 0; y < rows; y++) {

            int neighbours = 0; 
            for (int i = -1; i <= 1; i++) {
                for (int j = -1; j <= 1; j++) {
                    if( i +j  != 0){
                        neighbours += board[(x+i+columns)%columns][(y+j+rows)%rows].previous;
                        // printf("|%-2d|", neighbours);
                    }
                }
            }
             //printf("neighbours = %d, board[%d][%d].state = %d\n" , neighbours, x , y , board[x][y].state);

            neighbours -= board[x][y].previous;
            int chances = rand()% 101 ;
            if((board[x][y].state == 1) && (chances <= 95 )){
                board[x][y].state = 0; 
                totalRecovered++; //Recovered back to susceptible 
            }       
            else if((board[x][y].state == 1) && (chances >= 95)){
                board[x][y].state = 2; 
                totalDeath++; // Dead or Recovered 
            }          
            else if((board[x][y].state == 0) && (neighbours == 4)){
                board[x][y].state = 1; 
                totalInfected++;  // infected

            }

        }
    }

    // printf("totalDeath = %d", totalDeath);
    // printf("totalRecovered = %d", totalRecovered);
    // printf("totalInfected = %d", totalInfected);

  
}

//lee

// screen shot comparison 
