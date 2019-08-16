void setup() {
  size(500, 600);
  background(100);
}

void draw() {
  background(100);
  
  // style  - for display functions and modes
  // matrix - for only transformation functions
  
  // Transformation Functions
  // translate();
  // rotate();
  // scale();
  
  // PURPOSE
  // to get back to the previous settings 
  // HOW IT WORKS
  // create temporary settings and remove them after using
 
  pushMatrix(); // create a temporary memory space
  translate(width/2, height/2);
  rotate(frameCount * 0.01);
  fill(255, 255, 0); // yellow
  rectMode(CENTER);
  rect(0, 0, 150, 100);
  popMatrix(); // remove the temporary memory
  
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(frameCount * 0.01);
  fill(0, 0, 255); // blue
  rect(0, 0, 100, 80);
  popMatrix();
  
  // add more shapes with transformation?
}
