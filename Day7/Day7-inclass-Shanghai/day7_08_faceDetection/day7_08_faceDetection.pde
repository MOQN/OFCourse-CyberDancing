import gab.opencv.*; // openCV
import processing.video.*; // video
import java.awt.*; // JAVA

Capture cam;
OpenCV opencv; 

void setup() {
  size(640, 480);
  // when you use OpenCV, 
  // never use this renderer (P2D, P3D)
  
  background(0);
  
  cam = new Capture(this, 640/2, 480/2);
  cam.start();
  opencv = new OpenCV(this, cam.width, cam.height);
  opencv.loadCascade( OpenCV.CASCADE_FRONTALFACE ); // to detect face(s)
  //opencv.loadCascade( OpenCV.CASCADE_EYE ); // let's try eyes!
  //opencv.loadCascade( OpenCV.CASCADE_UPPERBODY ); // let's try my upper body!
}

void draw() {
  if ( cam.available() ) {
    cam.read();
  }
  background(0);
  image( cam, 0, 0 );
  
  opencv.loadImage( cam );
  Rectangle[] areas = opencv.detect(); // Java Syntax
  
  for (int i=0; i < areas.length; i++) {
    Rectangle face = areas[i]; // get one element!
    noFill();
    stroke(0, 255, 0);
    rect(face.x, face.y, face.width, face.height);
  } 
}
