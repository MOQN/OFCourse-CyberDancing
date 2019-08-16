import processing.video.*;

Capture cam;
PImage img;

void setup() {
  size(640, 480);
  background(0);

  cam = new Capture(this, 640, 480);
  cam.start();
  img = createImage(cam.width, cam.height, RGB); // blank image
}

void draw() {
  if ( cam.available() ) {
    cam.read();
  }
  cam.loadPixels();
  img.loadPixels();
  for (int y=0; y<cam.height; y++) {
    for (int x=0; x<cam.width; x++) {
      int index = x + y*cam.width; // ***
      color c = cam.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);

      float avg = (r + g + b) / 3;
      
      img.pixels[index] = color(avg); // gray
      
      // play with x, y, r, g, b, avg values!
      if ( x > width*1/3 ) {
        if (avg < 100 ) {
          img.pixels[index] = color(255, 0, 255);    
        } else if (avg < 150 ) {
          img.pixels[index] = color(255, 255, 0);
        } else {
          img.pixels[index] = color(0, 255, 255);
        }
      }
    }
  }
  img.updatePixels();

  background(0);
  image( img, 0, 0 );
}