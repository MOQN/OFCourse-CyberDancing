void setup() {
  size(500, 600);
  background(0);
}


void draw() {
  background(0);
  flower(100, 80, 0.1, 72, 1);
  flower(mouseX, mouseY, 2.0, 60, 2);
  // ellipse(x,y,w,h);
}


void flower(float x, float y, float scl, int agl, float spd) {
  noStroke();
  pushMatrix();
  translate( x, y );
  rotate( frameCount * 0.01 * spd );
  scale( scl );
  for (int angle=0; angle<360; angle += agl) {
    pushMatrix();
    //translate( 0, 0 );
    rotate( radians(angle) );
    fill(255, 200);
    ellipse( 80, 0, 120, 120 );
    popMatrix();
  }
  fill(255, 0, 0);
  ellipse(0, 0, 25, 25);
  popMatrix();
}
