import processing.video.*;

String[] characters = {" ", ".", "-", "=", "*", "@", "#", "%","&", "M"};
Capture cam;

void setup() {
  size(640, 480);
  background(0);

  cam = new Capture(this, 640, 480);
  cam.start();
}

void draw() {
  if ( cam.available() ) {
    cam.read();
  }
  
  background(0);
  
  cam.loadPixels();
  int res = 15;
  noStroke();
  textSize(res);
  for (int y=0; y<cam.height; y += res) {
    for (int x=0; x<cam.width; x += res) {
      int index = x + y*cam.width; // ***
      color c = cam.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float avg = (r + g + b) / 3;
      
      fill(c);
      int textIndex = int( map(avg, 0, 255, 0, characters.length-1) );
      text( characters[textIndex], x, y );
    }
  }
  //
}
