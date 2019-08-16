void setup() {
  size(800, 600, P3D);
  // fullScreen(P3D);
  background(0);
}

void draw() {
  background(0);
  
  // 3D
  translate(width/2, height/2);
  rotateY(frameCount * 0.01);
  
  pushMatrix();
  translate(-200, 0, 0); // (x, y, z)
  noFill();
  stroke(255);
  box(100, 200, 50); // (w, h, d)
  popMatrix();
}
