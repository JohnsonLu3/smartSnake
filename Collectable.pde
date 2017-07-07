class Collectable {

  int i;  // grid cords
  int j;  // grid cords

  int x;  // world cords
  int y;  // world cords


  Collectable() {

    rollLoc();

    while (true) {
      if (world[i][j] != 0) {
        // space is occupied, REROLL
        rollLoc();
      } else {
        break;
      }
    }
  }


  void collected() {
    // remove from world
    collected = true;
  }

  void rollLoc() {

    i = int(random(0, width/cellSize));
    j = int(random(0, height/cellSize));

    x = i * cellSize;
    y = j * cellSize;
  }
}