// IMA | NYU Shanghai
// Kinetic Interfaces
// MOQN
// Jan 24 2018

void setup() {
  size(500, 600);
  noStroke();  
}

void draw() {
  background(100);
  
  //pushMatrix();
  translate(width/2, height/2);
  rotate( radians(frameCount) );
  fill(255,0,0);
  rect(0,0, 100,100);
  //popMatrix();
  
  translate(100, 100);
  rotate( radians(frameCount*2) );
  fill(255,255,0);
  rect(0,0, 50, 50);
}