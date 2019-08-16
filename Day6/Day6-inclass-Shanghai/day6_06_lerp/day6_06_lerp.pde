// https://en.wikipedia.org/wiki/Linear_interpolation

float x = 0;
float y = 0;

void setup() {
  size(1000, 400);
}

void draw() {
  background(0);
   
  x = lerp(x, mouseX, 0.05);
  y = lerp(y, mouseY, 0.05);
  ellipse(x, y, 30, 30);
}
