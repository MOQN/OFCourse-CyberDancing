// REUSABILITY & MODULARITY

void setup() {
  size(500, 600);
  background(0);
  ellipseMode(CENTER);
}

void draw() {
  background(0);
  
  int res = 50;
  for (int y = 0; y <= height; y += res) {
    for (int x = 0; x <= width; x += res) { 
      fill(255);
      noStroke();
      spinningEllipse(x, y, res, 10);
    }
  }
}

void spinningEllipse(float x, float y, float w, float h) {
  pushMatrix();
  translate(x, y);
  rotate( frameCount * 0.01 );
  ellipse(0, 0, w, h);
  popMatrix();
}
