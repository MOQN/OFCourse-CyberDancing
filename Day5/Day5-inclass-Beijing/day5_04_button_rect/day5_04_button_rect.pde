int x, y, w, h;
color c;

void setup() {
  size(500, 600);
  background(0);
  
  x = 200;
  y = 200;
  w = 100;
  h = 200;
  c = color(255);
}


void draw() {
  background(0);

  if ( mouseX > x && mouseX < x + w
    && mouseY > y && mouseY < y + h) {
    // mouse is in this area!
    c = color(255, 255, 0); // yellow
    if (mousePressed) {
      c = color(255, 0, 0); // 
    }
  } else {
    // mouse is out of this area...
    c = color(255); // white
  }
  
  noStroke();
  fill(c);
  rect(x, y, w, h);
}
