void setup() {
  size(800, 500);
  background(0);
}

void draw() {
  background(0);
  wave(height/2 - 10, 0.005);
  wave(height/2, 0.006);
  wave(height/2 + 20, 0.007);
}

void wave(float _y, float adj) {
  int resolution = 3;
  for (int x=0; x<width; x += resolution) {
    float freq, amp;

    freq = frameCount * 0.005; // 0.005
    amp = adj; 
    float sinFreq = sin(freq) * amp;

    freq = frameCount * 0.02;
    amp = 20; // -20 to 20
    float sinAmp = sin(freq) * amp;
    
    float ampAdj = map(mouseY, 0, width, 0, 200);
    
    freq = frameCount*sinFreq + x*sinFreq; // time + position
    //freq = frameCount*0.01 + x*0.01; // time + position
    amp = ampAdj + sinAmp; // 80 to 120
    float sinVal = sin(freq) * amp;

    //float x = frameCount;
    float y = _y + sinVal;

    float size = random(1, 4);
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }
}
