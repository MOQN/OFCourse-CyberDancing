// MOQN
// 2019.07.28


void setup() {
  size(800, 600, P2D);
  background(0);
  
  setupKinectV2();
}


void draw() {
  background(0);
  
  updateKinectV2();
  displayKinectV2();
  
  noStroke();
  fill(255);
  ellipse(kinectX, kinectY, 10, 10);
}
