void setup() {
  size(400,500);
  background(0);
}

void draw() {
  background(0);

  fill(255,0,0); // red
  spinningRect(100, 50, 150, 100, -5.0, 0.5);
  stroke(0,0,255); // blue
  noFill();
  spinningRect(mouseX, mouseY, 30, 150, 0.5, 3.0);
}



// user-defined function
void spinningRect(float x, float y, float w, float h, float spd, float scl) {
  pushMatrix();
  translate(x, y);
  rotate( radians(frameCount * spd) );
  scale(scl);
  rectMode(CENTER);
  rect(0,0, w, h);
  popMatrix();
}
