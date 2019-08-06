float x, y;
float r, g, b;

void setup() {
  size(500, 600);
  background(255);
  x = width/2;
  y = height/2;
  r = 0;
  g = 0;
  b = 0;
}

void draw() {
  //background(255);
  // void mousePressed() { } // WRONG! 
}

void keyPressed() {
  // char = ' ';  single quotation mark 
  if (key == ' ') {
    background(255);  
  }
}

void mouseDragged() {
  float size = 30;
  noStroke();
  fill(r, g, b);
  ellipse( mouseX, mouseY, size, size );
}

void mousePressed() {
  r = random(255);
  g = random(255);
  b = random(255);
}
