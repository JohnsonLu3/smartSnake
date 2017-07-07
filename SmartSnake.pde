int[][] world;
int cellSize = 5;
int spawnCheck = 0;
Player player;

void setup() {
  size(500, 500);
  background(255);
  player = new Player();
  world = new int[width/cellSize][height/cellSize];
}

void draw() {
  fill(0);
  rect(player.x, player.y, cellSize, cellSize);

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
}

void keyPressed() {

  println("x: " + player.x + "   y: " + player.y );

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

void reset() {
  clear();
  background(255);
  player = new Player();
  world = new int[width/cellSize][height/cellSize];
}