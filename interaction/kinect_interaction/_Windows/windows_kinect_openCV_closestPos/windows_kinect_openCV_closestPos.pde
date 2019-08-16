// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Apr 11 2018


import KinectPV2.*;
import gab.opencv.*;
import controlP5.*;


OpenCV opencv;
ControlP5 cp5;

KinectPV2 kinect2;
PImage depthImg;

int thresholdMin = 0;
int thresholdMax = 4499;


void setup() {
  size(512, 424, P2D);

  kinect2 = new KinectPV2(this);
  kinect2.enableDepthImg(true);
  kinect2.init();

  // Blank image
  depthImg = new PImage(KinectPV2.WIDTHDepth, KinectPV2.HEIGHTDepth, ARGB);
  
  // Blank OpenCV Image
  opencv = new OpenCV(this, depthImg);

  // add gui
  int sliderW = 100;
  int sliderH = 20;
  cp5 = new ControlP5( this );
  cp5.addSlider("thresholdMin")
    .setPosition(10, 40)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(0)
    ;
  cp5.addSlider("thresholdMax")
    .setPosition(10, 70)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(4499)
    ;
}


void draw() {
  background(0);

  int[] rawDepth = kinect2.getRawDepthData();
  depthImg.loadPixels();
  for (int i=0; i < rawDepth.length; i++) {
    int depth = rawDepth[i];
    
    if (depth >= thresholdMin
      && depth <= thresholdMax
      && depth != 0) {

      int x = i % KinectPV2.WIDTHDepth;
      int y = floor(i / KinectPV2.WIDTHDepth);

      float w = map(depth, thresholdMin, thresholdMax, 255, 0);
      depthImg.pixels[i] = color(w);
    } else {
      depthImg.pixels[i] = color(0, 0);
    }
  }
  depthImg.updatePixels();

  //image(kinect2.getDepthImage(), 0, 0);
  image(depthImg, 0, 0);
  
  
  opencv.loadImage(depthImg);
  opencv.gray();
  opencv.erode();
  opencv.erode();
  PVector closestPos = opencv.max();
  
  
  // draw the closest position
  stroke(0, 255, 0);
  line(closestPos.x, 0, closestPos.x, height);
  line(0, closestPos.y, width, closestPos.y);


  fill(255);
  text(frameRate, 10, 20);
}
