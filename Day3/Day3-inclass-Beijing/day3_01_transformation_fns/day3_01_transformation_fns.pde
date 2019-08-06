void setup() {
  size(500, 600);
  background(0);
  blendMode(ADD);
}

void draw() {
  //background(0);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate( radians(71.98*frameCount) );
  //rectMode(CENTER);
  noFill();
  stroke(255, 30, 120, 30);
  ellipse(frameCount*0.5, 0, 100, 250-frameCount);
  popMatrix();
  
  //if (frameCount == 500) {
  //  noLoop();
  //}
}
