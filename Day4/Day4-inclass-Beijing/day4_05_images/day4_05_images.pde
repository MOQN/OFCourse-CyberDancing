PImage img; 

void setup() {
  size(500, 600);
  background(0);
  img = loadImage( "colorful.jpg" );
}


void draw() {
  //background(0);
  
  // ***** NEVER LOAD IMAGE IN DRAW() !! *****
  
  // image( imgV, x, y );
  // image( imgV, x, y, w, h );
  //image(img, 0, 0);
  
  imageMode(CENTER);
  image(img, mouseX, mouseY, 100, 100);
  
  
  
  
  
  
}
