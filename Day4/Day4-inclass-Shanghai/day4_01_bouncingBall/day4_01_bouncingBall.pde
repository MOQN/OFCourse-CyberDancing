float x, y;
float xSpd, ySpd;
float size;
float r, g, b;

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
}
