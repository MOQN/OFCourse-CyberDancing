// https://processing.org/reference/filter_.html

PImage img; 

void setup() {
  size(800, 600);
  background(0);
  img = loadImage( "colorful.jpg" );
}


void draw() {
  //background(0);
  for (int i=0; i<300; i++) {
    int x = int(random(width));
    int y = int(random(height));
    float size = random(5, 10);
    color c = img.get(x, y);
    fill(c);
    noStroke();
    ellipse(x, y, size, size);
  }
}
