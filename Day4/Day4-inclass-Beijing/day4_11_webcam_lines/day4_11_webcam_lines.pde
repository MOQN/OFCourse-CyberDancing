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
  noFill();
  int resolution = 20;
  cam.loadPixels();
  for (int y = 0; y < cam.height; y += resolution) {
    beginShape();
    for (int x = 0; x < cam.width; x += resolution) {
      int index = x + y*cam.width;
      color c = cam.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float avg = (r+g+b)/3;
      
      float yAdj = map(avg, 0, 255, 0, resolution*2);
      
      // will add something here
      //vertex( x, y + yAdj );
      curveVertex( x, y + yAdj );
    }
    endShape();
  }
}
