void setup() {
  size(500, 600);
  background(0);
}

void draw() {
  //background(0);

  float sinVal = sin(frameCount*0.01) * 100;
  float noiseVal = noise(frameCount*0.05) * 100;
  float randomVal = random(1) * 100;
  float x = frameCount;
  float y = height/2 + sinVal;

  noStroke();
  fill(255, 0, 0); // red
  ellipse(x, y, 3, 3);
  
  y = height/2 + randomVal; // random: 0 to 1
  fill(0, 0, 255); // blue
  ellipse(x, y, 3, 3);
  
  y = height/2 + noiseVal; // noise: 0 to 1
  fill(255, 255, 0); // yellow
  ellipse(x, y, 3, 3);
  
  // line 
  stroke(0, 255, 0); // green
  line(0, height/2, width, height/2);
}
