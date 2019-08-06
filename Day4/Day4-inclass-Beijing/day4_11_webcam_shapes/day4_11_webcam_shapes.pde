import processing.video.*;

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
      
      float mappedSize = map(avg, 0, 255, 0, resolution);
      noStroke();
      fill(255);
      ellipse(x, y, mappedSize, mappedSize);
    }
  }
}
