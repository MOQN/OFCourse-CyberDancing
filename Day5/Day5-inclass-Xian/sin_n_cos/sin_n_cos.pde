void setup() {
  size(400, 500);
  background(0);
}

void draw() {
  background(0);
  
  float freq = frameCount * 0.05; // frequency - time or angle!
  float amp = 100; // amplitude
  float sinVale = sin( freq ) * amp; // range -100 to 100
  float cosVale = cos( freq ) * amp;
  
  float x = width/2 + cosVale;
  float y = height/2 + sinVale;
  
  //float r = map(sinVale, -1, 1, 0, 255);
  //fill(r, 0, 255);
  
  noStroke();
  fill(255);
  ellipse(x, y, 30, 30);
  
  fill(255,0,0);
  ellipse(width/2, y, 10, 10);
  text( "sin()", width/2, y + 15);
  fill(255,255,0);
  ellipse(x, height/2, 10, 10);
  text( "cos()", x, height/2 + 15);
}
