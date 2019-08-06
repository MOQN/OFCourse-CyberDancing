void setup() {
  size(500, 600);
  background(100);
}

void draw() {
  background(100);
  
  fill(0,255,0); //green
  
  pushStyle();
  fill(255, 0, 0); //red
  //ellipseMode(CORNER);
  ellipse(150, 150, 200, 200);
  strokeWeight(5);
  point(150, 150);
  popStyle();
  
  pushStyle();
  rectMode(CENTER);
  // imageMode(CENTER);
  // blendMode(ADD); /// research about this!!!
  rect(300, 300, 150, 200);
  strokeWeight(5);
  point(300, 300);
  popStyle();
  
  rect(100, 400, 80, 80);
}
