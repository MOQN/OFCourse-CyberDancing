float x, y;
float xSpd, ySpd;

void setup() {
  size(500, 600);
  background(0);
  x = width/2;
  y = height/2;
  xSpd = random(-5, 5);
  ySpd = random(-5, 5);
}


void draw() {
  background(0);
  // update
  // check
  // display
  
  x += xSpd;  // x = x + xSpd;
  y += ySpd;  // y = y + ySpd;
  
  if (x < 0 || x > width) {
    xSpd = -xSpd;
    // xSpd *= -1; xSpd = xSpd * -1;
  }
  if (y < 0 || y > height) {
    ySpd = -ySpd;
  }
  
  ellipse(x, y, 80, 80);
  //flower(x, y, 0.5, 72, 3.0);
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
