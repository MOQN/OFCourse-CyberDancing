float x, y;
float w, h;
float r, g, b;

void setup() {
  size(500, 600);
  background(0);
  
  x = 200;
  y = 200;
  w = 100;
  h = 200;

  r = 255;
  g = 255;
  b = 255;
}


void draw() {
  background(0);
  // update
  // check (if)
  // display

  if ( mouseX > x && mouseX < x+w
    && mouseY > y && mouseY < y+h) {
    //in the area
    if (mousePressed) {
      // pressed
      r = 255;
      g = 0;
      b = 0;
    } else {
      // not pressed
      r = 255;
      g = 255;
      b = 0;
    }
  } else {
    // out of the area
    r = 255;
    g = 255;
    b = 255;
  }

  fill(r, g, b);
  noStroke();
  rect(x, y, w, h);
}
