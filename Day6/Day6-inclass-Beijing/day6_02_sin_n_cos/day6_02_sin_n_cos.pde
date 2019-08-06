void setup() {
  size(500, 600);
  background(100);
}

void draw() {
  background(100);
  float freq, amp;
  freq = frameCount * 0.05;
  amp = 200;
  float sinVal = sin(freq) * amp;
  float cosVal = cos(freq) * amp;
  
  float x = width/2 + cosVal;
  float y = height/2 + sinVal;
  
  noStroke();
  
  // sine
  fill(255,0,0); // red
  ellipse(width/2, y, 20, 20);
  // cosine
  fill(255,255,0); // yellow
  ellipse(x, height/2, 20, 20);
  // both
  fill(255); // white
  ellipse(x, y, 35, 35);
}
