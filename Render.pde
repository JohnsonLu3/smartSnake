void drawPlayArea(){
  //draw playArea
  fill(255);
  noStroke();
  rect(offSet, offSet, playArea, playArea);
  resetGrid();

}

void drawPlayerHead(){
  //draw player HEAD
  fill(255,0,0);
  rect(playerLoc.get(0).x, playerLoc.get(0).y, cellSize, cellSize);
  //print("x: " + ((playerLoc.get(0).x - offSet)/cellSize) + "y: " + ((playerLoc.get(0).y - offSet)/cellSize) + "\n" );
  grid[((playerLoc.get(0).x - offSet)/cellSize)][((playerLoc.get(0).y - offSet)/cellSize)] = 1;
}

void drawPlayerBody(){
  //draw player body
  for (int i =1; i < playerLoc.size(); i++) {
    fill(0);
    rect(playerLoc.get(i).x, playerLoc.get(i).y, cellSize, cellSize);
    grid[((playerLoc.get(i).x - offSet)/cellSize)][((playerLoc.get(i).y - offSet)/cellSize)] = 1;
  }
}

void drawCollectable(){
  //draw collectable
  spawnCollectiable();

  fill(0, 255, 0);
  rect(collectable.x, collectable.y, cellSize, cellSize);
  grid[((collectable.x - offSet)/cellSize)][((collectable.y - offSet)/cellSize)] = 2;
}


void renderText() {
  //score
  textSize(24);
  String scoreText = "Score:  " + score;
  text(scoreText, 50, 50);
  String distText = "Distance:  " + dist;
  text(distText, 50, 84);
  
  String timeText = "Hunger: " + nf((float)hungerTimer, 2, 2);
  text(timeText, 800, 50);
}