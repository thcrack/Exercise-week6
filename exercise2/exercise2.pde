PImage water;

void setup(){
  size(500,500);
  water = loadImage("water.png");    
  //imageMode(CENTER);
  for(int i = 0; i < waterY.length; i++){
    waterY[i] = 20 * i;
  }
}

float [] waterX = new float[25];
float [] waterY = new float[25];

void draw(){
  background(255);
  for(int i = 0; i < waterY.length; i++){
    waterY[i] += 20;
    waterY[i] %= height;
  }
  for(int i = 0; i < waterY.length; i++){
    if(waterY[i] == 0){
      waterX[i] = mouseX;
    }
    image(water,waterX[i],waterY[i]);
  }
}
