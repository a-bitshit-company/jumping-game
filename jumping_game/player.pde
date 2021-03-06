class Player{
  float rectWidth = 40;
  float rectHeight = 80;
  float y = height - rectHeight; 
  float x =  100;
  float ySpeed = 0;
  float grav = 1;
  int invincibleCooldown = 800;
  int invincibleDuration = 0;

  void show(){
     rect(x, y, rectWidth + 8, rectHeight + 22); // player wird verschoben, weil behindert
  }
  void move(){
     ySpeed += grav;
     glide();
     invincible();
     if (y > height - rectHeight){
       y = height - rectHeight - 1;
        ySpeed = 1;
     }
       y += ySpeed;
         
    if(pressedKeys[' '] && y >= height - rectHeight){
      ySpeed -= 25;
    }
     
     
  }
  void glide(){
    if(pressedKeys[' '] && ySpeed > 0){
       ySpeed -= 0.8; 
    }
    
  }
  void invincible(){
     if(invincibleDuration > 0){
      invincibleDuration--;
       println(invincibleDuration);
    }
   
    if(invincibleCooldown > 0){
      invincibleCooldown--;
    }
    
    if(invincibleDuration <= 0){
      invincible = false;
      fill(255, 255, 255);
     
    }

    if(invincibleCooldown <= 0 && pressedKeys['x']){
     
      invincibleCooldown = 800;
      invincibleDuration = 250;
    }
    
    if(invincibleDuration !=0){
      fill(255, 0, 0);
      invincible = true;
      println(invincibleDuration);
    }
    
  }


  float[] getCoords(){
    return new float[]{x, y, rectWidth, rectHeight};
  }

}
