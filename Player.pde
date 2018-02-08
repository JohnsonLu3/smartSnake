class Player {

  int x;
  int y;

  int direction = 0;        // direction at which the player will move. 0 : idle, 1 : up, 2 : right, 3 : down, 4 : left

  Player() {
    x = width/2;
    y = height/2;
  }

  Player(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void dead() {
    reset();
  }

  void movement() {
    switch(direction) {
    case 1:   
      y -= cellSize;
      break;
    case 2:
      x += cellSize;
      break;
    case 3:
      y += cellSize;
      break;
    case 4:
      x -= cellSize;
      break;
    default:
      break;
    }
  }

  void changeDirection(int dir) {
    direction = dir;
  }
  
}