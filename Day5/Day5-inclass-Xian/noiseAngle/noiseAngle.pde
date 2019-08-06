void setup() {
  size(500, 600);
  background(120);
}

void draw() {
  background(120);
  
  pushMatrix();
  translate(width/2, height/2);
  
  float sinValue = sin(frameCount * 0.005) * PI/4;
  //float noiseValue = noise(frameCount * 0.005);
  sinValue = map(sinValue, 0, 1, -3, 3);
  
  rotate(sinValue);
  
  noStroke();
  fill(255,0,0);
  rectMode(CENTER);
  rect(0, 0, 300, 300);
  
  popMatrix();
  
}
