void setup() {
  size(400, 500);
  background(100);
}


void draw() {
  // loop
  //background(100); // clear
  
  float r = random(255);
  float g = random(255);
  float b = random(255);
  
  stroke( r, g, b );
  fill( r, g, b, 100 );
  float diameter = random(20, 60);
  ellipse( random(width), random(height), diameter, diameter );
  //line( width/2, height/2, mouseX, mouseY );
}
