///// transformation functions /////

// translate();
// rotate();
// scale(); // scale with %



void setup() {
  size(400,500);
  background(0);
}

void draw() {
  background(0);
  
  
  
  // rect
  // Radians? 0 PI
  // Degrees? 45, 90, 360
  // PI(rad) == 180(deg)
  
  // time ==> frameCount(int)
  // radians(deg) : convert deg to rad
  // degrees(rad) : convert rad to deg
  
  // to change the origin position
  translate(width/2, height/2);
  
  float angle = radians(frameCount);
  rotate( angle ); // takes radians and rotate the whole coordinate system
  scale(0.5);
  
  drawCoordinateSystem();
  
  noStroke();
  fill(255,255,0);
  rectMode(CENTER);
  rect(frameCount, 0, 150, 150); //(x,y,w,h)
}

void drawCoordinateSystem() {
  stroke(255,0,0); // red
  line(-width, 0, width, 0);
  line(0, -height, 0, height);
}
