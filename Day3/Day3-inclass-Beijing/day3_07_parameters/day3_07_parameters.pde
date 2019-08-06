float x, y;

void setup() {
  size(500, 600);
  setTheValues(width/2, height/2);
  ellipse(x, y, 100, 100);
}

void draw() {
  //
}

void setTheValues(int tempX, int tempY) {
  x = tempX;
  y = tempY;
}
