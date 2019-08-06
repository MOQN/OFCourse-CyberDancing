// circle button

void setup() {
  size(400, 500);
  background(0);
}

void draw() {
  background(0);

  float r, g, b;
  float x, y, rad;
  r = 255;
  g = 255;
  b = 255;
  x = width/2;
  y = height/2;
  rad = 50;

  //dist(x1, y1, x2, y2);
  float distance = dist(x, y, mouseX, mouseY);
  if ( distance < rad ) {
    // in the area
    r = 255;
    g = 0;
    b = 0;
    if (mousePressed) {
      r = 0;
      g = 255;
      b = 0;
    }
  } else {
    // out of the area
    r = 255;
    g = 255;
    b = 255;
  }

  fill(r, g, b);
  ellipse(x, y, rad*2, rad*2);
}
