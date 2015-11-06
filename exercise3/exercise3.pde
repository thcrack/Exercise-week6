PImage water, flowerA, flowerB, flowerC;

void setup(){
  size(500,500);
  water = loadImage("water.png");    
  flowerA = loadImage("flower_safe.png");
  flowerB = loadImage("flower_warning.png");
  flowerC = loadImage("flower_danger.png");
  //imageMode(CENTER);
  for(int i = 0; i < waterY.length; i++){
    waterY[i] = 20 * i;
    waterConsume[i] = true;
  }
  for(int i = 0; i < flowerHP.length; i++){
    flowerHP[i] = 100;
  }
}

boolean [] waterConsume = new boolean[25];
float [] waterX = new float[25];
float [] waterY = new float[25];
float [] flowerHP = new float[5];
int [] flowerState = new int[5];

void draw(){
  background(255);
  
  //draw water
  
  for(int i = 0; i < waterY.length; i++){
    waterY[i] += 20;
    waterY[i] %= height;
  }
  for(int i = 0; i < waterY.length; i++){
    if(waterY[i] == 0){
      waterX[i] = mouseX;
      waterConsume[i] = true;
    }
    if(waterConsume[i]){
      image(water,waterX[i],waterY[i]);
    }
  }
  
  // draw flower
  
  for(int i = 0; i < flowerHP.length; i++){
    if(flowerHP[i] > 70){
      flowerState[i] = 0;
    }else if(flowerHP[i] <= 70 && flowerHP[i] > 40){
      flowerState[i] = 1;
    }else if(flowerHP[i] <= 40){
      flowerState[i] = 2;
    }
    switch(flowerState[i]){
      case 0:
        image(flowerA,50+80*i,420);
        break;
      case 1:
        image(flowerB,50+80*i,420);
        break;
      case 2:
        image(flowerC,50+80*i,420);
        break;
    }
    flowerHP[i] -= 0.3;
    if(flowerHP[i] < 0){
      flowerHP[i] = 0;
    }
  }
  
  // watering detection
  
  for(int i = 0; i < waterX.length; i++){
    for(int j = 0; j < flowerHP.length; j++){
      if(waterConsume[i] == true && waterX[i] >= 50+80*j && waterX[i] <= 50+80*(j+1) && waterY[i] >= 420){
        flowerHP[j] += 2;
        if(flowerHP[j] > 100){
          flowerHP[j] = 100;
        }
        waterConsume[i] = false;
      }
    }
  }
}
