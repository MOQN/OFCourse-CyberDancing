// https://processing.org/reference/beginShape_.html
// https://processing.org/reference/endShape_.html

void setup() {
  size( 500, 600 );
  background(0);
}

void draw() {
  background(0);

  noFill();
  stroke(0, 255, 0); // green
  
  // add points as many as you want!!
  beginShape();
  vertex(254, 90);
  vertex(105, 482);
  vertex(414, 182);
  vertex(54, 194);
  vertex(410, 459);
  endShape(CLOSE);
}

void mousePressed() {
  println( "vertex("   +   mouseX   +   ","   +   mouseY   +   ");" );
}
