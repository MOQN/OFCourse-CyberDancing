void setup() {
  size(600, 600);
  background(0);
  
}
void draw() {
  //background(0);
  
  float x = random(width);
  float y = random(height);
  
  float distance = dist(x,y, width/2, height/2);
  
  float dia = map(distance, 0, 300, 30, 1);
  dia = constrain(dia, 1, 30);
  ellipse(x, y, dia, dia);
  
}
