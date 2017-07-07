int[][] world;          // 0 : empty space, 1: player's body, 2 : collectable
Cell[] playerLoc;      // player body pieces locations
int cellSize = 5;
Collectable collectable;

boolean collected;

int score;
int dist;

Player player;

void setup() {
  frameRate(10);
  size(500, 500);
  background(255);
  score = 0;
  dist = 0;
  collected = true;
  player = new Player();
  world = new int[width/cellSize][height/cellSize];
}

void draw() {
  background(255);

  //draw player
  fill(0);
  rect(player.x, player.y, cellSize, cellSize);

  //draw collectable
  spawnCollectiable();

  println("Score: " + score);

  fill(125);
  rect(collectable.x, collectable.y, cellSize, cellSize);


  //Check Dead?
  if (player.x < 0 || player.x > width || player.y < 0 || player.y > height)
    player.dead();

  //Check if collected?
  if (player.x == collectable.x && player.y == collectable.y) {
    collectable.collected();
    score += 500;
  }



  // Movement
  switch(player.direction) {
  case 1:   
    player.y -= cellSize;
    break;
  case 2:
    player.x += cellSize;
    break;
  case 3:
    player.y += cellSize;
    break;
  case 4:
    player.x -= cellSize;
    break;
  default:
    break;
  }

  //record player location
}

void keyPressed() {

  if (key == 'r') {
    println("reseting...");
    reset();
  }

  if (key == CODED) {
    switch(keyCode) {
    case UP:   
      player.direction = 1;
      break;
    case DOWN:
      player.direction = 3;
      break;
    case LEFT:
      player.direction = 4;
      break;
    case RIGHT:
      player.direction = 2;
      break;
    }
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

  player = new Player();
  world = new int[width/cellSize][height/cellSize];
}