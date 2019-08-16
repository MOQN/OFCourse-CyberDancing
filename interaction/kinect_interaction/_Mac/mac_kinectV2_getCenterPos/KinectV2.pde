// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Apr 9 2018


import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import controlP5.*;


ControlP5 cp5;

Kinect2 kinect2;
PImage depthImg;

int DISTANCE_MIN = 0;
int DISTANCE_MAX = 4499;

float centerX = 0;
float centerY = 0;
float kinectX = 0;
float kinectY = 0;

boolean displayToggle = true;
float displayToggleInterval = 15;


void setupKinectV2() {

  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();

  // Blank image
  depthImg = new PImage(kinect2.depthWidth, kinect2.depthHeight, ARGB);

  // add gui
  int sliderW = 100;
  int sliderH = 20;
  cp5 = new ControlP5( this );
  cp5.addSlider("DISTANCE_MIN")
    .setPosition(10, 40)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(0)
    ;
  cp5.addSlider("DISTANCE_MAX")
    .setPosition(10, 70)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(4499)
    ;
}

void updateKinectV2() {
  float sumX = 0;
  float sumY = 0;
  int count = 0;
  int[] rawDepth = kinect2.getRawDepth();
  depthImg.loadPixels();
  for (int i=0; i < rawDepth.length; i++) {
    int depth = rawDepth[i];

    if (depth >= DISTANCE_MIN
      && depth <= DISTANCE_MAX
      && depth != 0) {

      int x = i % kinect2.depthWidth;
      int y = floor(i / kinect2.depthWidth);

      float r = map(depth, DISTANCE_MIN, DISTANCE_MAX, 255, 0);
      float b = map(depth, DISTANCE_MIN, DISTANCE_MAX, 0, 255);

      depthImg.pixels[i] = color(r, 0, b);

      sumX += x;
      sumY += y;
      count++;
    } else {
      depthImg.pixels[i] = color(0, 0);
    }
  }
  depthImg.updatePixels();
  
  // get the center position
  float avgX = 0;
  float avgY = 0;
  if (count > 0) {
    avgX = sumX / count;
    avgY = sumY / count;
  }
  
  centerX = lerp(avgX, centerX, 0.3);
  centerY = lerp(avgY, centerY, 0.3);
  
  kinectX = map(centerX, 0, kinect2.depthWidth, 0, width);
  kinectY = map(centerY, 0, kinect2.depthHeight, 0, height);
}

void displayKinectV2() {
  // toggle the UI
  if (keyPressed && displayToggleInterval <= 0) {
    if (key == 'i' || key == 'I') {
      displayToggle = !displayToggle;
      if (displayToggle) {
        cp5.show();
      } else {
        cp5.hide();
      }
    }
    displayToggleInterval = 15;
  }
  if (displayToggleInterval > 0) {
    displayToggleInterval--;
  }
  if (!displayToggle) return;
  
  // display
  pushStyle();
  image(kinect2.getDepthImage(), 0, 0);
  image(depthImg, 0, 0);

  // draw the center position
  stroke(0, 255, 0);
  line(centerX, 0, centerX, height);
  line(0, centerY, width, centerY);

  fill(255);
  text(frameRate, 10, 20);
  popStyle();
}
