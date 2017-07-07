ArrayList<Player> playerLoc;      // player body pieces locations
int cellSize = 5;
int playArea = 800; 
int offSet = 100;
int scoreMul = 50;
Collectable collectable;

boolean start = false;
boolean collected;

int score;
int dist;

void setup() {
  frameRate(15);
  size(1000, 1000);
  background(125);
  score = 0;
  dist = 0;
  collected = true;
  Player player = new Player();
  playerLoc = new ArrayList<Player>();
  playerLoc.add(player);
}

void draw() {

  background(125);

  renderText();

  //Check Dead?
  if (playerLoc.get(0).x < 0 + offSet || playerLoc.get(0).x > width - offSet || playerLoc.get(0).y < 0 + offSet || playerLoc.get(0).y > height - offSet)
    playerLoc.get(0).dead();

  for (int i = 1; i < playerLoc.size(); i++) {
    // check if player collides with itself
    if (playerLoc.get(0).x == playerLoc.get(i).x && playerLoc.get(0).y == playerLoc.get(i).y)
      playerLoc.get(0).dead();
  }

  //draw playArea
  fill(255);
  noStroke();
  rect(offSet, offSet, playArea, playArea);


  //draw player HEAD
  fill(255,0,0);
  rect(playerLoc.get(0).x, playerLoc.get(0).y, cellSize, cellSize);

  //draw player body
  for (int i =1; i < playerLoc.size(); i++) {
    fill(0);
    rect(playerLoc.get(i).x, playerLoc.get(i).y, cellSize, cellSize);
  }

  //draw collectable
  spawnCollectiable();


  fill(0, 255, 0);
  rect(collectable.x, collectable.y, cellSize, cellSize);


  //Check if collected?
  if (playerLoc.get(0).x == collectable.x && playerLoc.get(0).y == collectable.y) {
    collectable.collected();
    score += scoreMul;

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
  if(start)
    dist++;
}

void keyPressed() {

  //DEBUG Keys
  switch(key) {
  case 'r':
    println("reseting...");
    reset();
    break;
  case 's':
    println("Score: " + score + "    playerSize = " + playerLoc.size());

    break;
  case '<':
    frameRate(frameRate - 1);

    break;
  case '>':
    frameRate(frameRate + 1);

    break;
  case 'i':
    for (int i =0; i < playerLoc.size(); i++) {
      println("[" + i + "] " + "x = " + playerLoc.get(i).x + "  y = " + playerLoc.get(i).y);
    }
    break;
  }


  int direction = 0;

  if (key == CODED) {
    
    start = true;
    
    switch(keyCode) {
    case UP:   
      direction = 1;
      break;
    case DOWN:
      direction = 3;
      break;
    case LEFT:
      direction = 4;
      break;
    case RIGHT:
      direction = 2;
      break;
    }
  }

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
}

void renderText() {
  //score
  textSize(24);
  String scoreText = "Score:  " + score;
  text(scoreText, 50, 50);
  String distText = "Distance:  " + dist;
  text(distText, 50, 84);
}