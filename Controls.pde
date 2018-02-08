void keyPressed() {

  //DEBUG Keys
  switch(key) {
  case 'p':
    printGrid();
    break;
  case 'r':
    println("reseting...");
    reset();
    break;
  case 's':
    println("Score: " + score + "    playerSize = " + playerLoc.size());
    break;
  case 'i':
    for (int i =0; i < playerLoc.size(); i++) {
      println("[" + i + "] " + "x = " + playerLoc.get(i).x + "  y = " + playerLoc.get(i).y);
    }
    break;
  case 'f':
    int [] foodLocation = whereIsFood();
    print("x: " + foodLocation[0]+ " y: "+ foodLocation[1]);
    break;
  }


  int direction = 0;
  //if (key == CODED) {

  //  start = true;

  //  switch(keyCode) {
  //  case UP:   
  //    direction = 1;
  //    break;
  //  case DOWN:
  //    direction = 3;
  //    break;
  //  case LEFT:
  //    direction = 4;
  //    break;
  //  case RIGHT:
  //    direction = 2;
  //    break;
  //  }
  //}

  for (int i = 0; i < playerLoc.size(); i++) {
    playerLoc.get(i).changeDirection(direction);
  }
}