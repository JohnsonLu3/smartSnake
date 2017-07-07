class Collectable {

  int x;  // world cords
  int y;  // world cords


  Collectable() {

    rollLoc();

    while (true) {
      for (int i =0; i < playerLoc.size(); i++ ) {
        Player cell = playerLoc.get(i);

        if (cell.x == x && cell.y == y) {
          // space is occupied, REROLL
          rollLoc();
        } else {
          break;
        }
      }
      break;
    }
  }


  void collected() {
    // remove from world
    collected = true;
  }

  void rollLoc() {

    x = int(random(0, playArea/cellSize)) * cellSize + offSet;
    y = int(random(0, playArea/cellSize)) * cellSize + offSet;

  }
}