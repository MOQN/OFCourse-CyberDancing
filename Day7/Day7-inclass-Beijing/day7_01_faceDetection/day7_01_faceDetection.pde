//https://docs.opencv.org/3.4.1/d7/d8b/tutorial_py_face_detection.html

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture cam;
OpenCV cv;

void setup() {
  size(640, 480);
  // note that if you want to use OpenCV library,
  // don't use any acceleration such as "P2D" or "P3D"!!
  background(0);
  
  cam = new Capture(this, 640, 480);
  cam.start();
  cv = new OpenCV(this, cam.width, cam.height);
  cv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
}

void draw() {
  if ( cam.available() ) {
    cam.read();
  }
  background(0);
  image(cam, 0, 0);
  
  // put the webcam image(frame) into OpenCV
  cv.loadImage( cam );
  // Then we can do some process now!
  
  // detect a shape with the cascade data loaded in setup()
  Rectangle[] faces = cv.detect(); 
  
  for (int i=0; i<faces.length; i++) {
    Rectangle face = faces[i];
    noFill();
    stroke(0, 255, 0); // green
    rect(face.x, face.y, face.width, face.height);
  }
}
