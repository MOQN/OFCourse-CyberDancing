void setup() {
  size(500, 600);
  background(0);
}

void draw() {
  //background(0);
  
  translate( width/2, height/2 );
  rotate(frameCount * 0.02);
  //rotate(radians(72*frameCount));
  
  //fill(255,0,0); // red
  //noStroke();
  noFill();
  stroke(255, 0, 150, 100);
  rectMode(CENTER);
  rect(0, 0, frameCount*2.0, frameCount);
  
  // draw the origin and canvas area
  //noFill();
  //stroke(0, 255, 0); // green
  //strokeWeight(1);
  //rectMode(CORNER);
  //rect(0, 0, width, height);
  //strokeWeight(5);
  //point(0, 0);
  
}
