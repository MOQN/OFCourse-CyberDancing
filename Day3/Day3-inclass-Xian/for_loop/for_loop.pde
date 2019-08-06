void setup() {
  size(400, 500);
  background(0);
  
  // for-loop!
  //for (from; until; increment) { // do something }
  
  // how many times you want to repeat!
  for (int i=0; i<5; i++) {
    println( i );
  }
  
  // fill something in a range!
  int rectSize = 40;
  for (int x=0; x<width; x += rectSize) {
    noStroke();
    fill(random(255),random(255),random(255));
    rect(x, 0, rectSize, rectSize);
  }
  
  // range! how about angle! -- learn about it! and ask questions!
  
  colorMode(HSB, 360, 100, 100);
  pushMatrix();
  translate(width/2, height/2);
  for (int angle=0; angle<360; angle += 10) {
    pushMatrix(); // to wrap only rotate() function! 
    rotate( radians(angle) );
    fill(angle, 100, 100); // Hue, Sat, Brightness
    ellipse(100, 0, 30, 30);
    popMatrix(); // remove the rotation!
  }
  popMatrix();
}

void draw() {
  //
}






// x += xSpeed // x = x + xSpeed;
// x += 5      // x = x + 5;
// x += -5     // x = x - 5;
// x -= 5      // x = x - 5;
// x++;        // x = x + 1;
