Player player;
public boolean[] pressedKeys = new boolean[100000];
Obstacle[] obstacles;
Counter deathCounter;
Counter score;
Counter invinciblecooldown;
Counter deathCountertxt;
Counter scoretxt;
Counter invincibleCooldowntxt;
Counter invincibleBar;
boolean invincible;
float speed;
Menu menu;
boolean showMenu = true;

void setup(){ 
  invincible = false;
  speed = - 8;
  
  score = new Counter();  
  deathCounter = new Counter();  
  invinciblecooldown = new Counter();
  scoretxt = new Counter();
  deathCountertxt = new Counter();
  invincibleCooldowntxt = new Counter();
  invincibleBar = new Counter();
  
  menu = new Menu();
  obstacles = new Obstacle[3];
  for(int i = 0; i < obstacles.length; i++){
    obstacles[i] = new Obstacle(i * 500 + width + (int) random(250));
  }
  size(1700, 800);
  player = new Player();
 // smooth(4);
  color(0);
  noStroke();
}
void draw(){
  background(0);
  if(showMenu){
    menu.show();
    if(pressedKeys[' '] == true){
      showMenu = false;
    }
  }else{
  score.plusPlus();
  speed -= 0.0025;
  
  
  score.show(100, 150);
  deathCounter.show(width - 100, 150);
  invinciblecooldown.set(player.invincibleCooldown); 
  if(player.invincibleCooldown <= 0){
    text("PRESS X", width / 2 - 100, 150);
  }
  else{
     invinciblecooldown.show(width / 2, 150);
  }
  invincibleBar.invincibleBar(player.invincibleDuration);
  deathCounter.showText("Deaths", width - 125, 75);
  invincibleCooldowntxt.showText( "Cooldown", width / 2, 75);
  scoretxt.showText("Score", 100, 75);
  
  
  player.show();
  player.move();
  println("a");
  
  for(int i = 0; i < obstacles.length; i++){
    obstacles[i].show();
    obstacles[i].move();
    //death
    if(!invincible && compareCoords(player.getCoords(), obstacles[i].getCoords())){
      score = new Counter();
      deathCounter.plusPlus();
      delay(350);
      restart();
    }
  }
  }
}

boolean compareCoords(float[] objA, float[]objB){
  boolean xEquals = (objA[0] > objB[0] && objA[0] < (objB[0] + objB[2])) 
  ||(objA[0] + objA[2] < objB[0] + objB[2]) && (objA[0] + objA[2] > objB[0]);
  
  boolean yEquals = objA[1] > objB[1] && objA[1] < (objB[1] + objB[3])
  || (objA[1] + objA[3] > objB[1]) && (objA[1] + objA[3] < objB[1] + objB[3]);
  if(xEquals && yEquals ){
    return true;
  }
  return false;
}




void restart() {
  println("restart");
  showMenu = true;
  
  for(int i = 0; i < obstacles.length; i++){
    obstacles[i] = new Obstacle(i * 500 + width);
  }
  speed = -8;
  player = new Player();
}
 
//tolowercase!!
void keyPressed(){
  pressedKeys[key] = true;
}

void keyReleased(){
  pressedKeys[key] = false;
}
