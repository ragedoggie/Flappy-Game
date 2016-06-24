 class Player {
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  float jumpImpulse;
  float gravity;
  float yVelocity;
  PImage spongebob;
 

  Player() {
    spongebob = loadImage("smallMario.png");
    jumpImpulse = -12;
    gravity = 1;
    objWidth = 50;
    objHeight = 50;
    xPos = 50;
    yPos = (height/2) - objHeight;
    yVelocity = 0;
  }

  // Shows player.
  void show() {
    // WRITE METHOD
    image(spongebob, xPos, yPos, objWidth, objHeight);
  }

  // Moves player down.
  void move() {
    // WRITE METHOD
    yVelocity =yVelocity + gravity;
    yPos = yPos + yVelocity;
    
  }
 
  // Moves player up.
  void jump() {
    yVelocity = jumpImpulse;
    // WRITE METHOD
  }
 
 }