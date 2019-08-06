// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Apr 11 2018


import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import gab.opencv.*;
import controlP5.*;


OpenCV opencv;
ControlP5 cp5;

Kinect2 kinect2;
PImage depthImg;

int DISTANCE_MIN = 0;
int DISTANCE_MAX = 4499;

float closestX = 0;
float closestY = 0;
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
  
  // Blank OpenCV Image
  opencv = new OpenCV(this, depthImg);

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
  int[] rawDepth = kinect2.getRawDepth();
  depthImg.loadPixels();
  for (int i=0; i < rawDepth.length; i++) {
    int depth = rawDepth[i];
    
    if (depth >= DISTANCE_MIN
      && depth <= DISTANCE_MAX
      && depth != 0) {

      int x = i % kinect2.depthWidth;
      int y = floor(i / kinect2.depthWidth);

      float w = map(depth, DISTANCE_MIN, DISTANCE_MAX, 255, 0);
      depthImg.pixels[i] = color(w);
    } else {
      depthImg.pixels[i] = color(0, 0);
    }
  }
  depthImg.updatePixels();

  opencv.loadImage(depthImg);
  opencv.gray();
  opencv.erode();
  opencv.erode();
  PVector closestPos = opencv.max();
  
  closestX = lerp(closestPos.x, closestX, 0.3);
  closestY = lerp(closestPos.y, closestY, 0.3);
  
  
}

void displayKinectV2() {
  //image(kinect2.getDepthImage(), 0, 0);
  image(depthImg, 0, 0);
  
  // draw the closest position
  stroke(0, 255, 0);
  line(closestX, 0, closestX, height);
  line(0, closestY, width, closestY);


  fill(255);
  text(frameRate, 10, 20);
  
}
