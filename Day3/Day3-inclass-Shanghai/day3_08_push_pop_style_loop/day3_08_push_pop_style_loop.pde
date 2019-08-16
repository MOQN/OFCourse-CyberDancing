void setup() {
  size(400, 500);
  background(100);
  frameRate(1);
}

void draw() {
  background(100);
  
  fill(0, 0, 255); // blue
  rect( 100, 100, 200, 80 );

  //pushStyle();
  fill(255, 0, 0); // red
  strokeWeight(5);
  rect( 100, 200, 200, 80 );
  //popStyle();
  
  //noLoop();
}
