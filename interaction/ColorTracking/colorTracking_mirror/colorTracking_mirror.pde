// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 27 2016


import processing.video.*;


Capture cam;
PImage mirrorImg;
PImage trackingImg;
color pickedColor;
int threshold = 20;

float avgX, avgY;
float lerpX, lerpY;
float lerpValue = 0.10;

void setup() {
  size(640, 480);
  
  cam = new Capture(this, 640, 480);
  cam.start();
  
  trackingImg = createImage(width, height, ARGB); //not RGBA
  mirrorImg = createImage(width, height, RGB);
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
  mirrorImg.loadPixels();
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      
      int camIndex =  x + y*w;
      int mirrorX = cam.width-1 - x;
      int mirrorIndex = mirrorX + y*w;
      mirrorImg.pixels[mirrorIndex] = cam.pixels[camIndex];

      float r = red(mirrorImg.pixels[mirrorIndex]);
      float g = green(mirrorImg.pixels[mirrorIndex]);
      float b = blue(mirrorImg.pixels[mirrorIndex]);

      if ( r > red(pickedColor)   - threshold && r < red(pickedColor)   + threshold
        && g > green(pickedColor) - threshold && g < green(pickedColor) + threshold
        && b > blue(pickedColor)  - threshold && b < blue(pickedColor)  + threshold )
      {
        trackingImg.pixels[mirrorIndex] = color(255, 0, 0);
        sumX += mirrorX; // *****
        sumY += y;
        count++;
      } else { 
        trackingImg.pixels[mirrorIndex] = color(0, 0);
      }
    }
  }
  mirrorImg.updatePixels();
  trackingImg.updatePixels();
  image(mirrorImg, 0, 0);
  image(trackingImg, 0, 0);

  if (count > 0) {
    avgX = sumX / count;
    avgY = sumY / count;
    lerpX = lerp(lerpX, avgX, lerpValue);
    lerpY = lerp(lerpY, avgY, lerpValue);
  }

  noStroke();
  fill(pickedColor);
  rect(10, 10, 50, 50);
  fill(255);
  text("Threshold: " + threshold, 70, 30);


  // show the center position of the tracking area
  noFill();
  stroke(0, 255, 0);
  ellipse(avgX, avgY, 10, 10);
  line(avgX, 0, avgX, height);
  line(0, avgY, width, avgY);
  
  noStroke();
  fill(255, 255, 0);
  ellipse(lerpX, lerpY, 20, 20);
}


void mousePressed() {
  pickedColor = mirrorImg.get(mouseX, mouseY);
}


void keyPressed() {
  if (keyCode == RIGHT || keyCode == UP) {
    threshold ++;
  } else if (keyCode == LEFT || keyCode == DOWN) {
    threshold --;
  }
  threshold = constrain(threshold, 0, 255);
}