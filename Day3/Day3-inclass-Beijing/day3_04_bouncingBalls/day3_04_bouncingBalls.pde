float x, y;
float xSpd, ySpd;

float x1, y1;
float xSpd1, ySpd1;

float x2, y2;
float xSpd2, ySpd2;

void setup() {
  size(500, 600);
  background(0);
  
  x = width/2;
  y = height/2;
  xSpd = random(-5, 5);
  ySpd = random(-5, 5);
  
  x1 = width/2;
  y1 = height/2;
  xSpd1 = random(-5, 5);
  ySpd1 = random(-5, 5);
  
  x2 = width/2;
  y2 = height/2;
  xSpd2 = random(-5, 5);
  ySpd2 = random(-5, 5);
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
  
  
  x1 += xSpd1;
  y1 += ySpd1;
  
  if (x1 < 0 || x1 > width) {
    xSpd1 = -xSpd1;
    // xSpd *= -1; xSpd = xSpd * -1;
  }
  if (y1 < 0 || y1 > height) {
    ySpd1 = -ySpd1;
  }
  
  ellipse(x1, y1, 80, 80);
  
  
  x2 += xSpd2;  // x = x + xSpd;
  y2 += ySpd2;  // y = y + ySpd;
  
  if (x2 < 0 || x2 > width) {
    xSpd2 = -xSpd2;
    // xSpd *= -1; xSpd = xSpd * -1;
  }
  if (y2 < 0 || y2 > height) {
    ySpd2 = -ySpd2;
  }
  
  ellipse(x2, y2, 80, 80);
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
