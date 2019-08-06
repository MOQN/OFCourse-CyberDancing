import processing.video.*;

Capture cam;
Movie mov;

void setup() {
  size( 640, 480 );
  background(100);
  
  cam = new Capture(this, 640, 480);
  cam.start();
  
  mov = new Movie(this, "sample.mp4");
  mov.loop();
}

void draw() {
  background(100);
  
  if (cam.available() == true) {
    cam.read();
  }
  if (mov.available() == true) {
    mov.read();
  }
  
  pushStyle();
  blendMode(ADD);
  image(cam, 0, 0);
  image(mov, 0, 0, width, height);
  popStyle();
}
