void setup() {
  size(400, 500);
  background(0);
}

void draw() {
  background(0);
  
  wave(height/2 - 14, 0.0028);
  wave(height/2 + 0,  0.0030);
  wave(height/2 + 20, 0.0032);
  
}

// adjustment

void wave(float offsetY, float freqAdj) {
  for (int x=0; x<width; x+=3) {
    float freq, amp;
    
    freq = frameCount * freqAdj;
    amp = 0.02;
    float adj = sin(freq) * amp;
    
    // time? angle? position?
    freq = (frameCount + x) * adj; // time + position
    amp = map(mouseY, 0, height, 0, 150);
    float sinValue = sin(freq)*amp;

    float y = offsetY + sinValue;
    
    float dia = random(1,5);
    noStroke();
    fill(255, 150);
    ellipse(x, y, dia, dia);
  }
}
