float r;
float g;
float b;

void setup() {
  size(400, 500);
  background(255);

  r = random(255);
  g = random(255);
  b = random(255);
}

void draw() {
  // nothing for now
}

void mouseDragged() {
  noStroke();
  fill(r, g, b);
  ellipse(mouseX, mouseY, 30, 30);
}

void mouseReleased() {
  r = random(255);
  g = random(255);
  b = random(255);
}

void keyPressed() {
  background(255);
}
