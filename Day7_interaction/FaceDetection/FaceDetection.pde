void setup() {
  size(640, 480);
  setupFaceDetection();
}


void draw() {
  background(0);
  updateFaceDetection();
  displayFaceDetection();
  
  // if you only want to detect the first person's face
  if (faces.size() > 0) {
    Face f = faces.get(0); // index: 0 - the first face
    noFill();
    stroke(255, 0, 0);
    ellipse(f.centerX, f.centerY, 30, 30);
  }
  
  // if you only want to detect every person's face
  for (int i=0; i<faces.size(); i++) {
    Face f = faces.get(i);
    noFill();
    stroke(255, 255, 0);
    ellipse(f.centerX, f.centerY, 50, 50);
  }
}




















// Based on: Face It by Daniel Shiffman / ITP Fall 2013 
// https://github.com/shiffman/Face-It

// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Oct 13 2016


import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;


OpenCV opencv;
Capture cam;

Rectangle[] faceRects;
PImage smallerImg;

int scale = 4;

ArrayList<Face> faces = new ArrayList<Face>();


void setupFaceDetection() {

  cam = new Capture(this, 640, 480);
  cam.start();

  opencv = new OpenCV(this, cam.width/scale, cam.height/scale);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 

  smallerImg = createImage(opencv.width, opencv.height, RGB);
}

void updateFaceDetection() {
  if ( cam.available() ) {
    cam.read();

    smallerImg.copy(cam, 
      0, 0, cam.width, cam.height, 
      0, 0, smallerImg.width, smallerImg.height);
    smallerImg.updatePixels();
  }
  // We have to always "load" the  image into OpenCV 
  // But we check against the smallerImg image here
  opencv.loadImage(smallerImg);
  faceRects = opencv.detect();  

  if (faceRects != null) {
    faces.clear();
    for (int i = 0; i < faceRects.length; i++) {
      float x = faceRects[i].x * scale;
      float y = faceRects[i].y * scale;
      float w = faceRects[i].width * scale;
      float h = faceRects[i].height * scale;

      faces.add( new Face(x, y, w, h) );
    }
  }
}

void displayFaceDetection() {
  pushStyle();

  image(cam, 0, 0);
  for (int i=0; i<faces.size(); i++) {
    Face f = faces.get(i);
    noFill();
    stroke(0, 255, 0);
    strokeWeight(2);
    rect(f.x, f.y, f.w, f.h);
    strokeWeight(5);
    point(f.centerX, f.centerY);
  }

  popStyle();
}

class Face {
  float x, y;
  float w, h;
  float centerX, centerY;
  Face(float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    centerX = x + w/2;
    centerY = y + h/2;
  }
}
