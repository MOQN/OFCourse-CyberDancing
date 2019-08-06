void setup() {
  size(500, 600);
  background(0);
}

void draw() {
  //background(0);
  noStroke();
  fill(100);
  terrain(height, 3, 0.01, 500);
  fill(150);
  terrain(height, 7, 0.01, 400);
  fill(200);
  terrain(height, 8, 0.01, 300);
  fill(250);
  terrain(height, 0, 0.01, 200);
}

void terrain(float _y, float offset, float freq, float amp) {
  beginShape();
  vertex(0, height); // control point
  vertex(0, _y); // starting point
  for (int x = 0; x <= width; x += 20) {
    float noiseVal = noise( x*freq + offset);
    float y = _y + map(noiseVal, 0, 1, 0, -amp);
    curveVertex(x,y);
  }
  vertex(width, _y); // ending point
  vertex(width, height); // control point
  endShape(CLOSE);
}
