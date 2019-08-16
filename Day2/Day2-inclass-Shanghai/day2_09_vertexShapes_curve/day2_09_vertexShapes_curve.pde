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
  curveVertex(234, 55);
  curveVertex(222, 175);
  curveVertex(135, 126);
  curveVertex(161, 191);
  curveVertex(82, 196);
  curveVertex(166, 258);
  curveVertex(23, 380);
  curveVertex(177, 376);
  curveVertex(120, 524);
  curveVertex(209, 425);
  curveVertex(260, 529);
  curveVertex(265, 347);
  curveVertex(382, 519);
  curveVertex(mouseX, mouseY);
  curveVertex(447, 401);
  curveVertex(384, 270);
  curveVertex(470, 268);
  curveVertex(323, 245);
  curveVertex(417, 201);
  curveVertex(297, 206);
  curveVertex(363 + cos(frameCount*0.5)*50, 127 + sin(frameCount*0.5)*50);
  curveVertex(270, 190);
  curveVertex(270, 32);
  curveVertex(253, 70);
  curveVertex(251, 52);
  endShape(CLOSE);
}

void mousePressed() {
  println( "curveVertex("   +   mouseX   +   ","   +   mouseY   +   ");" );
}
