void setup() {
  size(500, 600);
  background(100);
}

void draw() {
  background(100);

  ///// TRANSFORMATION FUNCTIONS /////
  // translate( x, y) // shift the origian position!
  // scale(1.0);      // 1.0 = 100%
  // rotate( PI );    // it takes radians!

  pushMatrix();
  translate( 350, 400 );
  rotate( radians(frameCount) );
  rectMode(CENTER);
  fill(255, 0, 0);
  rect(0, 0, 150, 100);
  popMatrix();

  pushMatrix();
  translate(mouseX, mouseY);
  rotate(frameCount * 0.01);
  scale(2.0);
  fill(0, 255, 0);
  rect(0, 0, 50, 200);
  popMatrix();

  // ORIGIN
  //stroke(0,255,0); //green
  //strokeWeight(1);
  //line(-width, 0, width, 0);
  //line(0, -height, 0, height);
  //strokeWeight(5);
  //point(0,0);
}
