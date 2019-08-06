void setup() {
  size(400, 500);
  background(255);
}

void draw() {
  background(255);
  
  star();
}

void star() {
  // vertex shape
  beginShape();
  vertex(206,64);
  vertex(83,394);
  vertex(363,183);
  vertex(44,184);
  vertex(289,399);
  endShape(CLOSE);
}


void mousePressed() {
  println( mouseX + "," + mouseY );
}
