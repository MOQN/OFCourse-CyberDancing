// https://processing.org/reference/beginShape_.html
// https://processing.org/reference/endShape_.html

void setup() {
  size(500, 600);
  background(0);
}

void draw() {
  background(0);

  //stroke(255);
  fill(255);

  beginShape();
  vertex(268, 121);
  vertex(125, 461);
  vertex(423, 213);
  vertex(70, 242);
  vertex(411, 443);
  endShape(CLOSE);
}

void mousePressed() {
  //println( mouseX + " " + mouseY );
  println( "vertex(" + mouseX + "," + mouseY + ");" );
}
