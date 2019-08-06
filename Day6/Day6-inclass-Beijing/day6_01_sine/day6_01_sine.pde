void setup() {
  size(500, 600);
  background(100);
}

void draw() {
  background(100);
  float freq, amp;
  freq = frameCount * 0.1; // time, angle, position
  amp = 200; // range, distance from the center == radius
  float sinVal = sin(freq) * amp;
  
  float x = width/2;
  float y = height/2 + sinVal;

  ellipse(x, y, 30, 30);
}
