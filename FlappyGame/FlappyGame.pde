import processing.sound.*;

int score;
int gameState; // 0 = start, 1 = running, 2 = over
Player me;
Pipe pipeOne;
Pipe pipeTwo;
PImage backgroundImg;
SoundFile mystlc;
SoundFile pass;
SoundFile die;

void setup() {
  backgroundImg = loadImage("plain.png");
  size(500, 500);
  textAlign(CENTER);
  score = 0;
  gameState = 0;
  me = new Player();
  pipeOne = new Pipe(1);
  pipeTwo = new Pipe(2);
  mystlc = new SoundFile(this,"MYSTLC7 clash of clans intro song.mp3");
  mystlc.loop();
  pass = new SoundFile(this, "Achievement Sound Effect.mp3");
  die = new SoundFile(this, "Pacman Death Sound Effect.mp3");
}

void draw() {
  image(backgroundImg,0,0,width,height);
  if (gameState == 0) {
    // game start
    fill(random(255), random(255), random(255));
    textSize(30);
    text("flappy game", width/2, 100);
    me.show();
    pipeOne.show();
  } else if (gameState == 1) {
    // game running
    text(score, 100,50);

    me.move();
    me.show();
    pipeOne.show();
    pipeOne.move();
    pipeTwo.move();
    pipeTwo.show();
    //check if player is off the screen
    if (me.yPos < 0 || me.yPos + me.objHeight > height ) {
      gameState = 2;
      die.play();
    }
    
    if(me.xPos < pipeOne.xPos + pipeOne.objWidth 
    && me.xPos + me.objWidth > pipeOne.xPos 
    &&me.yPos < pipeOne.yPos + pipeOne.objHeight 
    && me.yPos + me.objHeight > pipeOne.yPos){
      gameState = 2;
      die.play();
      
    } 
    
    if(me.xPos < pipeTwo.xPos + pipeTwo.objWidth 
    && me.xPos + me.objWidth > pipeTwo.xPos 
    &&me.yPos < pipeTwo.yPos + pipeTwo.objHeight 
    && me.yPos + me.objHeight > pipeTwo.yPos){
      gameState = 2;
      die.play();
      
    } 
    
    if (pipeOne.counted == false && pipeOne.xPos + pipeOne.objWidth < me.xPos){
      score = score +1;
      pipeOne.counted = true;
      pass.play();

    }
    
    if (pipeTwo.counted == false && pipeTwo.xPos + pipeTwo.objWidth < me.xPos){
      score = score +1;
      pipeTwo.counted = true;
      pass.play();

    }
    
    me.show();
    pipeOne.show();
    pipeTwo.show();
  } else { // gameState == 2
    // game over
    mystlc.stop();
    fill(random(30));
    textSize(50);
    text("game over", width/2, height/2);
    text(score, 100,50);
    fill(random(255),random(255),random(255));
    text("click A to restart", 250, 300);

  }
  println(gameState);
}

void keyPressed() {
  if (key == ' ' && gameState == 0) {
    gameState = 1;
  }

  if (key == ' ' && gameState == 1) {
    me.jump();
  }
  if ( key == 'a'  && gameState == 2){
    score = 0;
    me = new Player();
    pipeOne = new Pipe(1);
    pipeTwo = new Pipe(2);
    gameState = 0;
   mystlc.loop(); 
    
  }
}