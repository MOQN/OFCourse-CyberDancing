float x, y;
float rad; // radius
color clr;

void setup() {
  size(500, 600);
  background(0);

  x = width/2;
  y = height/2;
  rad = 100;
  clr = color(255); // white
}


void draw() {
  background(0);

  //float distance = dist(x1, y1, x2, y2);
  float distance = dist(x, y, mouseX, mouseY);
  if (distance < rad) {
    // in the area
    if (mousePressed) {
      clr = color(255, 0, 0); // red  
    } else {
      clr = color(255, 255, 0); // yellow
    }
  } else {
    // out of the area
    clr = color(255); // white
  }

  noStroke();
  fill( clr );
  ellipse(x, y, rad*2, rad*2);
}
