void setup() {
  size(500, 600);
  background(0);
  int rectSize = 10;
  for (int y=0; y<height; y += rectSize) {
    for (int x=0; x<width; x += rectSize) {
      noStroke();
      fill(random(255), random(255), random(255));
      rect(x, y, rectSize, rectSize);
    }
  }
}

void draw() {
  //
}
