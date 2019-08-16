// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 27 2016


import processing.video.*;


Capture cam;
PImage img;
color pickedColor;
int threshold = 20;

float avgX, avgY;

void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480);
  cam.start();
  img = createImage(640, 480, ARGB); //not RGBA
}


void draw() {
  if ( cam.available() ) {
    cam.read();
    cam.loadPixels();
  }
  
  int sumX = 0;
  int sumY = 0;
  int count = 0;
  
  int h = cam.height;
  int w = cam.width;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int i =  x + y*w; // IMPORTANT

      float r = red(cam.pixels[i]);
      float g = green(cam.pixels[i]);
      float b = blue(cam.pixels[i]);

      if ( r > red(pickedColor)   - threshold && r < red(pickedColor)   + threshold
        && g > green(pickedColor) - threshold && g < green(pickedColor) + threshold
        && b > blue(pickedColor)  - threshold && b < blue(pickedColor)  + threshold )
      {
        img.pixels[i] = color(255, 0, 0);
        sumX += x;
        sumY += y;
        count++;
      } else { 
        img.pixels[i] = color(0, 0);
      }
    }
  }
  img.updatePixels();
  image(cam, 0, 0);
  image(img, 0, 0);
  
  if (count > 0) {
    avgX = sumX / count;
    avgY = sumY / count;
  }

  noStroke();
  fill(pickedColor);
  rect(10, 10, 50, 50);
  fill(255);
  text("Threshold: " + threshold, 70, 30);
  
  
  // show the center position
  
  noFill();
  stroke(0, 255, 0);
  ellipse(avgX, avgY, 10, 10);
  line(avgX, 0, avgX, height);
  line(0, avgY, width, avgY);
}


void mousePressed() {
  pickedColor = cam.get(mouseX, mouseY);
}


void keyPressed() {
  if (keyCode == RIGHT || keyCode == UP) {
    threshold ++;
  } else if (keyCode == LEFT || keyCode == DOWN) {
    threshold --;
  }
  threshold = constrain(threshold, 0, 255);
}