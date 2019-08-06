float x = 0;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  background(0);
  for (int x = 0; x < width; x++) {
    float freq = frameCount* 0.1 + x * 0.1; // position, angle or time!
    float amp = 10; // -10 to 10
    float sinValue = sin(freq) * amp;
    float y1 = height/2 + sinValue;
    float y2 = height/2 - sinValue;
    
    noStroke();
    fill(255);
    ellipse(x, y1, 3, 3);
    ellipse(x, y2, 3, 3);
  }
  
}
