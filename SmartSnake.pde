
void setup() {
  frameRate(FRAMERATE);
  size(1000, 1000);
  background(125);
  score = 0;
  dist = 0;
  collected = true;
  Player player = new Player();
  playerLoc = new ArrayList<Player>();
  playerLoc.add(player);

  grid = new int[(playArea/cellSize)+2][(playArea/cellSize)+2];      // empty 0 | body 1 | food 2
}

void draw() {

  background(125);

  renderText();
  hungerTimer = hungerTimer - .01f;

  checkDead();

  // Render objects
  drawPlayArea();
  drawPlayerHead();
  drawPlayerBody();
  drawCollectable();

  checkCollected();
  randomlyMove();
  if (start)
    dist++;
  else
    start = true;
}