void setup() {
  size(600, 600);
}

void draw() {
  background(0);

  stroke(255);
  noFill();
  beginShape();
  curveVertex(268, 52);
  curveVertex(199, 132);
  curveVertex(92, 160);
  curveVertex(115, 266);
  curveVertex(80 + cos(frameCount*0.1) * 30, 375 + sin(frameCount*0.1) * 30);
  curveVertex(211, 428);
  curveVertex(223, 543);
  curveVertex(317, 450);
  curveVertex(445, 514);
  curveVertex(445, 354);
  curveVertex(541, 368);
  curveVertex(548, 203);
  curveVertex(454, 170);
  curveVertex(449, 66);
  curveVertex(337, 76);
  endShape(CLOSE);
}

void mousePressed() {
  println( "curveVertex(" + mouseX + "," + mouseY + ");" );
}
