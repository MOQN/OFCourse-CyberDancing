void setup() {
  size(800, 500, P3D);
  background(0);
}

void draw() {
  background(0);
  
  // 3D Space!
  translate(width/2, height/2); // move origin to center!
  // navigate
  float angleY = map(mouseX, 0, width, -PI, PI);
  rotateY(angleY);
  float angleX = map(mouseY, 0, height, PI, -PI);
  rotateX(angleX);
  
  
  // draw
  pushMatrix();
  translate(0, 0);
  noFill();
  stroke(255);
  box(200); // (size); (w,h,d);
  popMatrix();
  
  int res = 5;
  for (int y = -height/2; y < height/2; y += res) {
    for (int x = -width/2; x < width/2; x += res) {
      float freqX = (x + frameCount) * 0.005;
      float freqY = (y + frameCount) * 0.005;
      float val = noise(freqX, freqY);
      float z = map(val, 0, 1, 0, 255);
      strokeWeight(3);
      stroke(255);
      point(x, y, z);
    }
  }
  
  
}
