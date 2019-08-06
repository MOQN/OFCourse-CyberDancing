// global variables
float x;
float y;
float r, g, b;

//DataType functionName() { Scope! a block of code };

void setup() {
  size(500, 600);
  background(0);
  x = width/2;
  y = height/2;
  r = 255;
  g = 0;
  b = 0;
}

void draw() {
  background(0);
  // local variables
  float size = 200;

  fill(r, g, b);
  ellipse( x, y, size, size );
}

void mousePressed() {
  r = random(255);
  g = random(255);
  b = random(255);
}
