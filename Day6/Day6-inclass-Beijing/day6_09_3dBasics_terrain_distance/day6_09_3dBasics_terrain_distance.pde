void setup() {
  size(600, 600, P3D);
  background(0);
}

void draw() {
  background(0);
  
  // 3D Space!
  translate(width/2, height/2); // move origin to center!
  // navigate
  float angleY = map(mouseX, 0, width, -PI, PI);
  float angleX = map(mouseY, 0, height, PI, -PI);
  //rotateY(angleY);
  //rotateX(angleX);
  
  
  // draw
  pushMatrix();
  translate(0, 0, -200);
  rotateX( radians(30) );
  noFill();
  stroke(255);
  //box(200); // (size); (w,h,d);
  
  int res = 15;
  for (int y = -height/2; y < height/2; y += res) {
    beginShape();
    for (int x = -width/2; x < width/2; x += res) {
      
      // let's play with the amplitude!
      int maxAmp = 28;
      float distance = dist(0, 0, x, y);
      float amp = map(distance, 0, width/2, maxAmp, 0);
      amp = constrain(amp, 0, maxAmp);
      
      float freqX = (x + frameCount) * 0.01;
      float freqY = (y + frameCount) * 0.01;
      float val = noise(freqX, freqY);
      float z = map(val, 0, 1, 0, amp*amp);
      strokeWeight(2);
      stroke(255);
      vertex(x, y, z);
      //point(x, y, z);
    }
    endShape();
  }
  
  popMatrix();
  
  
}
