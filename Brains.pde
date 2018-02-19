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

int[] distanceToObstacle(){
  int [] distToObs = new int[]{-1,-1,-1,-1};  // [N,E,S,W]
  
  int playerX = playerLoc.get(0).x;
  int playerY = playerLoc.get(0).y;
   
  //N
  for(int y = playerY; y > offSet; y--){
    if(get(playerX, y) == bodyColor){
      distToObs[0] = playerY - y;  
      break;
    }
  }
  if(distToObs[0] == -1)
    distToObs[0] = playerY - offSet;
  
  //E
    for(int x = playerX; x < (playArea+offSet); x++){
    if(get(x, playerY) == bodyColor){
      distToObs[1] = x - playerX;  
      break;
    }
  }
  if(distToObs[1] == -1)
    distToObs[1] = playArea + offSet - playerX; 
  
  //S
    for(int y = playerY; y < (offSet + playArea); y++){
    if(get(playerX, y) == bodyColor){
      distToObs[2] = y - playerY;  
      break;
    }
  }
  if(distToObs[2] == -1)
    distToObs[2] = playArea + offSet - playerY;
  
  //W
    for(int x = playerX; x > offSet; x--){
    if(get(x, playerY) == bodyColor){
      distToObs[3] = playerX - x;  
      break;
    }
  }
  if(distToObs[3] == -1)
    distToObs[3] = playerX - offSet;
  
  return distToObs;
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
9. Body Piece location??????

How will it learn that going closer to food is a good thing? 
*/

double activationFunction(double val){
  double output = 0.0f;
  return output;
}

double getRandomWeight(){
  return random(-1,1);
}