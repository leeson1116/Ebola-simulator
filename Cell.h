#include <stdio.h>
#include <stdlib.h>
#include <time.h>
// #include <pthread.h>

// typedef struct Cell Cell;

// struct Cell { 
//     int x; 
//     int y; 
//     int state; 
//     int previous; 
// };

Cell* Cell_init(int x_, int y_);
void cell_free(Cell *ca);
void print_board(Cell* ca);
void generate();
void savePrevious();
void newState(Cell *ca, int s);
void init_board();

