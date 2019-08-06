PImage img; 

void setup() {
  size(400, 500);
  background(0);
  
  img = loadImage("colorful.jpg");
}

void draw() {
  background(0);
  
  //imageMode(CENTER);
  //image(img, mouseX, mouseY, 100, 100);
  // image( imgVariable, x, y);
  // image( imgVariable, x, y, w, h); // a bit slow
  
  //tint(255,255,255);
  image(img, 0, 0, width, height);
  //filter(INVERT);
  filter(THRESHOLD, 0.9); // %, 0.0 to 1.0
  //filter(BLUR, 6);
  
  
  
}
