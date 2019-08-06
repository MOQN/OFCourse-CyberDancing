// IMA | NYU Shanghai
// Kinetic Interfaces
// MOQN
// Jan 24 2018

int value;

void setup() {
  size(500, 600);
}

void draw() {
  background(0);
  
  value = mouseX;
  text(value, mouseX, mouseY);
}