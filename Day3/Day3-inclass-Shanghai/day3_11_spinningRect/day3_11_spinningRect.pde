// REUSABILITY & MODULARITY

void setup() {
  size(700, 600);
  background(0);
}

void draw() {
  background(0);
  
  // rect(x,y,w,h);
  
  // fill(0, 0, 255);
  // ellipse(x,y,w,h);
  
  fill(0, 0, 255);
  spinningRect(100, 100, 100, 20, 0.01);
  
  fill(0, 255, 255);
  spinningRect(300, 100, 100, 30, 0.02);
  
  stroke(255, 0, 255);
  noFill();
  spinningRect(500, 100, 100, 40, 0.03);
  
  fill(255);
  noStroke();
  spinningRect(mouseX, mouseY, 100, 5, -0.05);
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
