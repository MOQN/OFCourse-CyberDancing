void setup() {
  size(800, 500);
  background(0);
}

void draw() {
  background(0);

  for (int x=0; x<width; x++) {
    float freq, amp;
    
    freq = frameCount*0.01 + x*0.01; // time + position
    amp = 100;
    float sinVal = sin(freq) * amp;

    //float x = frameCount;
    float y = height/2 + sinVal;

    noStroke();
    fill(255);
    ellipse(x, y, 3, 3);
  }
}
