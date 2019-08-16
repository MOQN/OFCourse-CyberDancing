import processing.video.*;

Capture cam;
PImage img;
color colorTracked;

void setup() {
  size(640, 480);
  background(0);

  colorTracked = color(255);
  cam = new Capture(this, 640, 480);
  cam.start();
  img = createImage(cam.width, cam.height, ARGB);
}

void draw() {
  if ( cam.available() ) {
    cam.read();
  }
  cam.loadPixels();
  img.loadPixels();
  for (int y = 0; y < cam.height; y++) {
    for (int x = 0; x < cam.width; x++) {
      int index = x + y*cam.width;
      color c = cam.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);

      float rT = red(colorTracked);
      float gT = green(colorTracked);
      float bT = blue(colorTracked);

      int range = 10;
      if ( r > rT - range && r < rT + range
        && b > bT - range && b < bT + range
        && g > gT - range && g < gT + range) {
        // yes!!!
        img.pixels[index] = color(255, 0, 0);
      } else {
        img.pixels[index] = color(0, 0);
      }
    }
  }
  img.updatePixels();

  background(0);
  image( cam, 0, 0 );
  image( img, 0, 0 );

  fill(colorTracked);
  noStroke();
  rect(30, 30, 50, 50);
}

void mousePressed() {
  colorTracked = cam.get(mouseX, mouseY);
}
