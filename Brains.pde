int randomMovement(){
  //int [] randomMovement = new int[1000000];
  int rand = (int)((Math.random() * 5));
  
  return rand;
}

int distanceToFood(){
  float a = abs(playerLoc.get(0).x - collectable.x);
  float b = abs(playerLoc.get(0).y - collectable.y);
  int dist2Food = (int)sqrt(pow(a, 2) + pow(b, 2));
  
  return dist2Food;
}

int[] distanceToWalls(){
  int [] distToWalls = new int [4];  // [N,E,S,W]
  
  int playerX = playerLoc.get(0).x;
  int playerY = playerLoc.get(0).y;
  
  //N
  distToWalls[0] = playerY - offSet;
  //E
  distToWalls[1] = playArea + offSet - playerX; 
  //S
  distToWalls[1] = playArea + offSet - playerY;
  //W
  distToWalls[1] = playerX - offSet;
  
  return distToWalls;
}


// Inputs for nerual network
/**
1. Direction
2. Dist from N wall
3. Dist from E wall
4. Dist from S wall
5. Dist from W wall
6. Dist from Food
7. Overall Distance
8. Score

How will it learn that going closer to food is a good thing? 
*/