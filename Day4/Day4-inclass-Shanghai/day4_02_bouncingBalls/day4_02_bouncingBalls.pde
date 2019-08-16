float x, y;
float xSpd, ySpd;
float size;
float r, g, b;

float x1, y1;
float xSpd1, ySpd1;
float size1;
float r1, g1, b1;

float x2, y2;
float xSpd2, ySpd2;
float size2;
float r2, g2, b2;

void setup() {
  size(500, 600);
  background(100);
  
  x = width/2;
  y = height/2;
  size = 50;
  xSpd = random(-5, 5);
  ySpd = random(-5, 5);
  r = random(255);
  g = random(255);
  b = random(255);
  
  x1 = width/2;
  y1 = height/2;
  size1 = 50;
  xSpd1 = random(-5, 5);
  ySpd1 = random(-5, 5);
  r1 = random(255);
  g1 = random(255);
  b1 = random(255);
  
  x2 = width/2;
  y2 = height/2;
  size2 = 50;
  xSpd2 = random(-5, 5);
  ySpd2 = random(-5, 5);
  r2 = random(255);
  g2 = random(255);
  b2 = random(255);
}

void draw() {
  background(100);

  // update
  x += xSpd; // x = x + xSpd;
  y += ySpd; // y = y + ySpd;

  // check
  if (x < 0 || x > width) {
    xSpd = -xSpd;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  if (y < 0 || y > height) {
    ySpd = -ySpd;
    r = random(255);
    g = random(255);
    b = random(255);
  }

  // display
  fill(r, g, b);
  noStroke();
  ellipse(x, y, size, size);
  
  
  // update
  x1 += xSpd1; // x = x + xSpd;
  y1 += ySpd1; // y = y + ySpd;

  // check
  if (x1 < 0 || x1 > width) {
    xSpd1 = -xSpd1;
    r1 = random(255);
    g1 = random(255);
    b1 = random(255);
  }
  if (y1 < 0 || y1 > height) {
    ySpd1 = -ySpd1;
    r1 = random(255);
    g1 = random(255);
    b1 = random(255);
  }

  // display
  fill(r1, g1, b1);
  noStroke();
  ellipse(x1, y1, size1, size1);
  
  
  // update
  x2 += xSpd2; // x = x + xSpd;
  y2 += ySpd2; // y = y + ySpd;

  // check
  if (x2 < 0 || x2 > width) {
    xSpd2 = -xSpd2;
    r2 = random(255);
    g2 = random(255);
    b2 = random(255);
  }
  if (y2 < 0 || y2 > height) {
    ySpd2 = -ySpd2;
    r2 = random(255);
    g2 = random(255);
    b2 = random(255);
  }

  // display
  fill(r2, g2, b2);
  noStroke();
  ellipse(x2, y2, size2, size2);
}
