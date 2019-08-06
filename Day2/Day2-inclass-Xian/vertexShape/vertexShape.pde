void setup() {
  size(400, 500);
  background(255);
}

void draw() {
  background(255);
  
  star(mouseX, mouseY);
  // rect(mouseX, mouseY, 100, 100);
}

void star(float x, float y) {
  
  //translate(x,y); // transformation function!
  
  // vertex shape
  beginShape();
  vertex(209,35);
  vertex(51,133);
  vertex(46,332);
  vertex(200,478);
  vertex(368,375);
  vertex(370,182);
  endShape(CLOSE);
}


void mousePressed() {
  println( mouseX + "," + mouseY );
}
