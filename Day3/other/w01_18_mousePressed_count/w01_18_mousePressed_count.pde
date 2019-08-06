// IMA | NYU Shanghai
// Kinetic Interfaces
// MOQN
// Jan 24 2018

int count;

void setup() {
  size(500, 600);
  background(0);
}

void draw() {
  background(0);
  text(count, 10, 20);
}

void mousePressed() {
  count++;  // count = count + 1;
}