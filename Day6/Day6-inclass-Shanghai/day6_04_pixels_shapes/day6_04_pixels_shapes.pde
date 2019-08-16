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
  
  cam.loadPixels();
  int res = 10;
  for (int y=0; y<cam.height; y += res) {
    for (int x=0; x<cam.width; x += res) {
      int index = x + y*cam.width; // ***
      color c = cam.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);

      float avg = (r + g + b) / 3;
      
      float dia = map(avg, 0, 255, 1, res);
      fill(255);
      noStroke();
      ellipse(x, y, dia, dia);
      
      //textSize(dia*2);
      //text(">_<", x, y);
    }
  }
  //
}
