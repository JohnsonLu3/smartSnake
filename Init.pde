ArrayList<Player> playerLoc;      // player body pieces locations
int cellSize = 5;
int playArea = 800; 
int offSet = 100;
int scoreMul = 50;
int FRAMERATE = 60;
double hungerTimer = 30;

Collectable collectable;

boolean start = false;
boolean DEBUG_direction = false;
boolean collected;

int score;
int dist;
int grid[][];