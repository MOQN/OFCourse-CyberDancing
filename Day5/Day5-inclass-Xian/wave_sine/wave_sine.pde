void setup() {
  size(400, 500);
  background(0);
}

void draw() {
  //
  float freq = frameCount * 0.05;
  float amp = 50;
  float sinValue = sin(freq)*amp;
  
  float x = frameCount;
  float y = height/2 + sinValue;
  
  stroke(0,0,255);
  line(0, height/2, width, height/2);
  
  noStroke();
  fill(255);
  ellipse(x, y, 3, 3);
  
  float noiseValue = noise(freq)*amp;
  
  float x1 = frameCount;
  float y1 = height/2 + noiseValue;
  
  fill(255, 0, 0);
  ellipse(x1, y1, 3, 3);
  
}
