import processing.video.*;

String[] characters = {"，", "一", "人", "山", "之", "中", "及", "所", "祥", "禎"};
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

  //image( cam, 0, 0 );
  //filter(THRESHOLD, 0.2); // % value
  
  ellipseMode(CORNER);
  int resolution = 20;
  cam.loadPixels();
  for (int y = 0; y < cam.height; y += resolution) {
    for (int x = 0; x < cam.width; x += resolution) {
      int index = x + y*cam.width;
      color c = cam.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float avg = (r+g+b)/3;
      
      int charIndex = int(map(avg, 0, 255, 0, 9.9999));
      
      noStroke();
      fill(255);
      text( characters[charIndex], x, y);
    }
  }
}
