void setup() {
  size(500, 600);
  background(0);
}

void draw() {
  //background(0);
  
  translate( width/2, height/2 );
  rotate(radians(71.9*frameCount));
  
  //fill(255,0,0); // red
  //noStroke();
  noFill();
  stroke(255, 0, 150, 100);
  rectMode(CENTER);
  rect(frameCount, 0, 100, 20);
  
  // draw the origin and canvas area
  //noFill();
  //stroke(0, 255, 0); // green
  //strokeWeight(1);
  //rectMode(CORNER);
  //rect(0, 0, width, height);
  //strokeWeight(5);
  //point(0, 0);
  
}
