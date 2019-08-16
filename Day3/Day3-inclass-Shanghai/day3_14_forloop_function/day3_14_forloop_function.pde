void setup() {
  size(1000, 600);
  background(0);
}


void draw() {
  background(0);
  
  ///// map() /////
  // float output = map(input, inMin, inMax, outMin, outMax); 
  
  int res = 50;
  for (int y = 0; y < height; y += res ) {
    for (int x = 0; x < width; x += res ) {
      
      float r = map(x, 0, width, 0, 255);
      float g = map(mouseX, 0, width, 0, 255);
      float b = map(y, 0, height, 255, 0); // flipped!
      noStroke();
      fill(r, g, b);
      spinningRect(x, y, res*2, 10, 0.01); // play with the numbers!
      
    }
  }
}


void spinningRect(float x, float y, float w, float h, float spd) {
  pushMatrix();
  translate(x, y);
  rotate( frameCount * spd );
  rectMode(CENTER);
  rect(0, 0, w, h);
  popMatrix(); 
}
