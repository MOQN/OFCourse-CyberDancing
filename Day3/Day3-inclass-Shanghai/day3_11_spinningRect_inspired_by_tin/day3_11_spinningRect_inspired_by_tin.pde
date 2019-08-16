// REUSABILITY & MODULARITY

void setup() {
  size(700, 600);
  background(0);
}

void draw() {
  //background(0);
  
  rectMode(CORNER);
  fill(0, 30);
  noStroke();
  rect(0, 0, width, height);
  
  noFill();
  stroke(0, 0, 255, 10);
  spinningRect(width/2, height/2, 100, 5, 0.005);
  stroke(0, 255, 255);
  spinningRect(width/2, height/2, 200, 5, 0.007);
  stroke(255, 0, 255);
  spinningRect(width/2, height/2, 300, 5, 0.009);
  stroke(255, 255, 0);
  spinningRect(width/2, height/2, 400, 5, 0.011);
  stroke(255, 0, 0);
  spinningRect(width/2, height/2, 500, 5, 0.013);
}

// user-defined function
void spinningRect(float x, float y, float w, float h, float spd) {
  pushMatrix();
  translate(x, y);
  rotate( frameCount * spd );
  rectMode(CENTER);
  rect(0, 0, w, h);
  popMatrix(); 
}
