void setup() {
  size(500, 600);
  background(0);
}

void draw() {
  background(0);
  
  int res = 10;
  for (int y = 0; y < height; y += res) {
    for (int x = 0; x < width; x += res) {
      float freqX = (x + frameCount) * 0.005;
      float freqY = (y + frameCount) * 0.005;
      float val = noise(freqX, freqY);
      float bri = map(val, 0, 1, 0, 255);
      noStroke();
      fill( bri );
      rect(x, y, res, res);
    }
  }
}
