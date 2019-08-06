int x, y, rad;
color c;

void setup() {
  size(500, 600);
  background(0);
  
  x = width/2;
  y = height/2;
  rad = 100;
  c = color(255);
}


void draw() {
  background(0);

  float distance = dist(x, y, mouseX, mouseY);
  if (distance < rad) {
    // Mouse is in the area!
    c = color(255, 255, 0); // yellow
    if (mousePressed) {
      c = color(255, 0, 0); // red
    }
  } else {
    // Mouse is out of the area!
    c = color(255); // white
  }
  
  noStroke();
  fill(c);
  ellipse(x, y, rad*2, rad*2);
}
