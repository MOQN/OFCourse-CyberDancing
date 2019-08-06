void setup() {
  size(400,500);
  background(0);
}

void draw() {
  background(0);
  
  rectMode(CENTER);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate( radians(frameCount) ); // radians e.g. PI
  noStroke();
  fill(255,0,0); // red
  rect(0, 0, 100, 80);
  popMatrix(); // translate back to the previous origin
  
  pushMatrix();
  translate(100, 100);
  rotate( radians(frameCount) ); // radians e.g. PI
  fill(255,255,0);
  rect(100,100, 50, 200);
  stroke(255,0,0);
  point(0, 0);
  popMatrix();
  
  // origin position
  //rectMode(CORNER);
  //noFill();
  //stroke(0, 255, 0);
  //strokeWeight(1);
  //rect(0, 0, width, height);
  //strokeWeight(3);
  //point(0, 0);
  
  
}
