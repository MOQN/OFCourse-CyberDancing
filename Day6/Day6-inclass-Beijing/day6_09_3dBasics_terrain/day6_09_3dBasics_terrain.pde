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
  float angleX = map(mouseY, 0, height, PI, -PI);
  rotateY(angleY);
  rotateX(angleX);
  
  
  // draw
  pushMatrix();
  translate(0, 0);
  rotateX( radians(90) );
  noFill();
  stroke(255);
  //box(200); // (size); (w,h,d);
  
  int res = 5;
  for (int y = -height/2; y < height/2; y += res) {
    beginShape();
    for (int x = -width/2; x < width/2; x += res) {
      float freqX = (x) * 0.008;
      float freqY = (y) * 0.008;
      float val = noise(freqX, freqY);
      float z = map(val, 0, 1, -50, 350);
      strokeWeight(3);
      stroke(255);
      vertex(x, y, z);
      //point(x, y, z);
    }
    endShape();
  }
  
  popMatrix();
  
  
}
