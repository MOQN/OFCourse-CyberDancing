import processing.video.*;

int threshold = 20;

Capture cam;
PImage img;

color colorTracked;

void setup() {
  size(640, 480);
  background(0);

  cam = new Capture(this, 640, 480);
  cam.start();

  img = createImage(cam.width, cam.height, ARGB);

  colorTracked = color(0);
}


void draw() {
  if ( cam.available() ) {
    cam.read();
    cam.loadPixels();
  }

  background(0);
  
  float sumX = 0;
  float sumY = 0;
  float avgX = 0;
  float avgY = 0;
  int count = 0;
  img.loadPixels();
  for (int y = 0; y < cam.height; y++) {
    for (int x = 0; x < cam.width; x++) {
      int index = x + y*cam.width;
      color c = cam.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);

      float tR = red(colorTracked);
      float tG = green(colorTracked);
      float tB = blue(colorTracked);
      
      if ( r > tR - threshold && r < tR + threshold
        && g > tG - threshold && g < tG + threshold
        && b > tB - threshold && b < tB + threshold ) {
        img.pixels[index] = color(255, 0, 0);
        sumX += x;
        sumY += y;
        count++;
      } else {
        img.pixels[index] = color(0, 0);
      }
    }
  }
  img.updatePixels();
  
  if (count > 0) {
    avgX = sumX / count;
    avgY = sumY / count;
  }

  image( cam, 0, 0 );
  image( img, 0, 0 );
  
  noStroke();
  fill(0, 255, 0);
  ellipse(avgX, avgY, 5, 5);
  
  

  // display the picked color
  stroke(255);
  fill(colorTracked);
  rect(50, 50, 50, 50);
}


void mousePressed() {
  // pick a pixel(color values) from an image
  colorTracked = cam.get(mouseX, mouseY);
}
