// REUSABILITY & MODULARITY

void setup() {
  size(500, 600);
  background(0);
}

void draw() {
  background(0);
  // ellipse(x,y,w,h);
  // try to imitate this processing's functions!
  
  fill(255,0,0);
  noStroke();
  spinningEllipse(mouseX, mouseY, 180, 30);
  
  fill(255,255,0);
  noStroke();
  spinningEllipse(100, 200, 180, 30);
}

void spinningEllipse(float x, float y, float w, float h) {
  pushMatrix();
  translate(x, y);
  rotate( frameCount * 0.01 );
  ellipse(0, 0, w, h);
  popMatrix();
}
