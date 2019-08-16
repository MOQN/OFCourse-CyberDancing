void setup() {
  size(500, 600);
  background(0);
  
  stroke(255,0,0);
  strokeWeight(3);
}

void draw() {
  background(0);
  // *****
  // the transformation functions work based on the origin (0, 0)
  
  // change the origin position
  translate(width/2, height/2);
  
  float angle = radians( frameCount );
  rotate( angle );
  rectMode(CENTER);
  rect(0, 0, 150, 120);
  
  // origin position
  point(0,0);
}
