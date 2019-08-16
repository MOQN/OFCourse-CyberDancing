// MOQN
// 2019.07.28

// Use "kinectX, kinectY" as you have used "mouseX, mouseY"
// :D
 

void setup() {
  size(800, 600, P2D);
  background(0);
  setupKinectV2();
}

void draw() {
  background(0);
  updateKinectV2();
  displayKinectV2();
  
  // add
}
