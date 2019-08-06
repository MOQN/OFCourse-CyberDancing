// rect button? circle button?

void setup() {
  size(400, 500);
  background(0);
}

void draw() {
  background(0);

  int r, g, b;
  float x, y, w, h;

  r = 255;
  g = 255;
  b = 255;

  x = 100;
  y = 150;
  w = 200;
  h = 150;

  if (mouseX > x && mouseX < x+w &&
    mouseY > y && mouseY < y+h) {
    // the mouse is in the area!
  } else {
    // the mouse is out of the area!
  }

  fill(r, g, b);
  rect(x, y, w, h);
}
