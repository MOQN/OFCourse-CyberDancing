// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Apr 8 2018

/** 
 * Based on Kinect for Windows v2 library for processing example code
 * by Thomas Sanchez Lengeling (http://codigogenerativo.com/)
 **/


PVector handL, handR;


void setup() {
  size(1920, 1080, P3D);
  
  handL = new PVector();
  handR = new PVector();

  setupKinect();
}


void draw() {
  background(0);
  
  updateKinect();
  
  noStroke();
  fill(255,0,0, 100);
  ellipse(handL.x, handL.y, 200, 200);
  fill(0,0,255, 100);
  ellipse(handR.x, handR.y, 200, 200);
}
