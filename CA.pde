class CA {
  //initializing the variables used in class ca 
  // columns , rows , totalDeath , totalRecovered , totalInfected 
//   initialising a 2d array Cell class object call board
  int w = 8 ;
  int columns, rows;
  int totalDeath;
  int totalRecovered; 
  int totalInfected;
  // Ebola simulator board
  Cell[][] board;

// class constructor initializing columns and set up arrays 
  CA() {
    // Initialize rows, columns and set-up arrays
    columns = width/w;
    rows = height/w;
    
    board = new Cell[columns][rows];
    // initialising the board with init function 
    init();
  }
  // create a function to loop through all the cell in the 2D array by using the Cell constructor 
 // and each Cell will have random state of 0 or 1 
  void init() {
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        board[i][j] = new Cell(i*w, j*w, w);
      }
    }
  }

  // a function to create the new generation
 // before generating ,loop through the cells and save the states into previous variable using savePrevious() function
//  for ( int i = 0; i < columns;i++) {
//      for ( int j = 0; j < rows;j++) {
//        cell.savePrevious();
//      }
//    }
 // create a loop to loop through each cell , inside that loop create another loop to find all the adjacent cells ( neighbours ) of that cell 
//  for (int x = 0; x < columns; x++) {
//      for (int y = 0; y < rows; y++) {
        // Add up all the states in a 3x3 surrounding grid
//       int neighbors = 0;
//        for (int i = -1; i <= 1; i++) {
//          for (int j = -1; j <= 1; j++) {
//            neighbors = neighbours + board[(x+i+columns)%columns][(y+j+rows)%rows].previous;          
//          }
//       }
 
//implementing the rules ; 
 //float  chances = random(0,100);
 //       if      ((board[x][y].state == 1) && (chances <= 95 )){board[x][y].newState(0); totalRecovered++; }        //Recovered back to susceptible 
 //       else if ((board[x][y].state == 1) && (chances >= 95)){ board[x][y].newState(2); totalDeath++; }           // Dead or Recovered 
 //       else if ((board[x][y].state == 0) && (neighbors == 4)){ board[x][y].newState(1); totalInfected++;     }    // infected 
 
 
  void generate() {
     for ( int i = 0; i < columns;i++) {
      for ( int j = 0; j < rows;j++) {
        board[i][j].savePrevious();
      }
    }
    // Loop through every spot in our 2D array and check spots neighbors
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {

        // Add up all the states in a 3x3 surrounding grid
        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
          // we used 
          if( i +j  != 0){
            neighbors += board[(x+i+columns)%columns][(y+j+rows)%rows].previous;
           
          }
            
          }
        }

        // subtract the current cell's state since
        // we added it in the above loop
        neighbors -= board[x][y].previous;
        
        
        // Rules OF Ebola simulation
        //  if more than 3 neighbours infected , change state to infected 
        //  50% dead chance , change from infected to dead
        //   95% of recovering , change state from infected to susceptible 
        //   Recovered patients can still be infected; 
       
         //States 
         // Dead or Recovered = 2
         // Infected = 1
         // Susceptible = 0
        float  chances = random(0,100);
        if      ((board[x][y].state == 1) && (chances <= 95 )){board[x][y].newState(0); totalRecovered++; }        //Recovered back to susceptible 
        else if ((board[x][y].state == 1) && (chances >= 95)){ board[x][y].newState(2); totalDeath++; }           // Dead or Recovered 
        else if ((board[x][y].state == 0) && (neighbors == 4)){ board[x][y].newState(1); totalInfected++;     }   // infected
        
        // Rules of Life
        //if less than two neighbours die  , change state from 1 to 0 
        //if more than three neighbours die too , change state from 1 to 0 
        // if equals to three neighbour regenerate change state to 1 
        
        //if      ((board[x][y].state == 1) && (neighbors <  2)) board[x][y].newState(0);           // Loneliness
        //else if ((board[x][y].state == 1) && (neighbors >  3)) board[x][y].newState(0);           // Overpopulation
        //else if ((board[x][y].state == 0) && (neighbors == 3)) board[x][y].newState(1);           // Reproduction
        //// else do nothing!
      }
    }
  }
  
// function to display data of totalDeath, totalRecovered and totalInfected
  void getData(){
    
    System.out.println("total Death :" + totalDeath);
    System.out.println("total Recovered :" + totalRecovered);
    System.out.println("total Infected :" + totalInfected);
  }

  // draw the cells, and display using the .display() function from cell class 
  void display() {
    for ( int i = 0; i < columns;i++) {
      for ( int j = 0; j < rows;j++) {
        board[i][j].display();
 
      }
    }
  }
}
