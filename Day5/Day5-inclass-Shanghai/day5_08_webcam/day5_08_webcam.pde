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
  //background(0);

  //tint(255, 0, 255);
  //image( cam, 0, 0 );

  //filter(INVERT);
  
  //cam.filter(THRESHOLD, 0.3);

  for (int i=0; i<1000; i++) {
    int x = int( random(cam.width) );
    int y = int( random(cam.height) );
    float size = random(2, 10);
    color c = cam.get(x, y);
    fill(c);
    noStroke();
    ellipse(x, y, size, size);
  }
}
