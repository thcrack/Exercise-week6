

void setup(){
  size(500,500);
  background(255);
  for(int i=0; i < lineX.length; i++){
    lineX[i]=0;
    lineY[i]=0;
  }
}

int lineGap = 20;
int [] lineX = new int[25];
float [] lineY = new float[25];

void draw(){
  for(int i = 0; i < lineX.length; i++){
    fill(255);
    stroke(255);
    rect(lineGap*i+1,0,lineGap,height);
    fill(#63F1F5);
    stroke(0);
    rect(lineGap*i,0,lineGap,lineY[i]);
    if(mouseX > lineGap * i && mouseX < lineGap * (i+1)){
      lineY[i] += 5;
      lineY[i] %= height;
    }
  }
}
