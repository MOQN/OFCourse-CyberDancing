float x, y; //memory space
float size;
float r, g, b;

void setup() {
  size(500, 600);
  background( 50 );
  
}

void draw() {
  //background( 50 );
  
  x = random(width);
  y = random(height);
  size = random(30, 100);
  
  r = random(255);
  g = random(255);
  b = random(255);
  
  stroke(r, g, b);
  fill(r, g, b, 100);
  ellipse( x, y, size, size );  // x,y,w,h
  //line( width/2, height/2, mouseX, mouseY );
}
