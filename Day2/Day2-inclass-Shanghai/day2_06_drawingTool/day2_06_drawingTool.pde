float x, y;
float size;
float r, g, b;

void setup() {
  size(500, 600);
  background(255);

  x = width/2;
  y = height/2;
  size = random(10, 30);
  r = random(255);
  g = random(255);
  b = random(255);
}

void draw() {
  //background(255);
}

// setup, draw, mouseInteractions, keyInteractions,
void mouseDragged() {
  //fill(r, g, b);
  //noStroke();
  //ellipse( mouseX, mouseY, size, size );
  
  stroke(r, g, b);
  strokeWeight(size);
  line( pmouseX, pmouseY , mouseX, mouseY);
  
  // spread random circles
  strokeWeight(1);
  ellipse( random(width), random(height), 1, 1 );
  ellipse( random(width), random(height), 2, 2 );
}

void mousePressed() {
  size = random(10, 30);
  r = random(255);
  g = random(255);
  b = random(255);
}

void keyPressed() {
  background(255); // white
}
