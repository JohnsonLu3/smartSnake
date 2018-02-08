void checkDead(){
  //Check Dead?
  
  if(hungerTimer <= 0)
     playerLoc.get(0).dead();

  if (playerLoc.get(0).x < 0 + offSet || playerLoc.get(0).x > width - offSet-1 || playerLoc.get(0).y < 0 + offSet || playerLoc.get(0).y > height - offSet-1)
    playerLoc.get(0).dead();

  for (int i = 1; i < playerLoc.size(); i++) {
    // check if player collides with itself
    if (playerLoc.get(0).x == playerLoc.get(i).x && playerLoc.get(0).y == playerLoc.get(i).y)
      playerLoc.get(0).dead();
  }
}

void checkCollected(){
    //Check if collected?
  if (playerLoc.get(0).x == collectable.x && playerLoc.get(0).y == collectable.y) {
    collectable.collected();
    score += scoreMul;
    hungerTimer = HUNGERTIMER;

    //add a new cell to PlayerLoc
    Player pCell = new Player();
    playerLoc.add(pCell);

    //update body Loctaions EXCULDE HEAD
    for (int i = playerLoc.size(); i > 1; i--) {
      playerLoc.get(i-1).x = playerLoc.get(i-2).x;
      playerLoc.get(i-1).y = playerLoc.get(i-2).y;
    }

    //update Head Location
    playerLoc.get(0).movement();
  } else {
    //update body Loctaions EXCULDE HEAD
    for (int i =playerLoc.size(); i > 1; i--) {
      playerLoc.get(i-1).x = playerLoc.get(i-2).x;
      playerLoc.get(i-1).y = playerLoc.get(i-2).y;
    }
        //update Head Location
    playerLoc.get(0).movement();
  }
}

void randomlyMove(){
  int direction = randomMovement();
  if(DEBUG_direction)
        print(direction);

    for (int i = 0; i < playerLoc.size(); i++) {
      playerLoc.get(i).changeDirection(direction);
    }
}


void spawnCollectiable() {

  if ( collected) {
    collectable = new Collectable();
    collected = false;
  }
}

void reset() {
  clear();
  background(255);
  score = 0;
  dist = 0;
  collected = true;
  start = false;

  Player player = new Player();
  playerLoc = new ArrayList<Player>();
  playerLoc.add(player);
  
  hungerTimer = HUNGERTIMER;
}

void resetGrid() {
  grid = new int[(playArea/cellSize)+2][(playArea/cellSize)+2];
}

void printGrid() {
  for (int y = 0; y < grid.length; y++) {
    for (int x = 0; x < grid[y].length; x++) {
      print(grid[x][y]);
    }
    println();
  }
  println("\n\n");
}