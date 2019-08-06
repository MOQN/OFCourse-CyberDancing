void setup() {
  size(400,500);
}

void draw() {
  background(0);
  
  pushStyle();
  stroke(0,255,0);
  strokeWeight(5);
  fill(255,0,0); // style!
  rectMode(CENTER);
  rect(100, 100, 100, 100);
  point(100, 100);
  popStyle(); // come back to the previous style setting
  
  noStroke();
  rect(200, 200, 100, 100);
  stroke(255,0,0);
  strokeWeight(5);
  point(200, 200);
  
  
  
  
  text( "hello!", 10, 20);
}
