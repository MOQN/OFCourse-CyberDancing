import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
// import KinectPV2.*; // WIN

Kinect2 kinect;
// KinectPV2 kinect; // WIN

void setup() {
  size( 512, 424 );
  background(0);
  
  kinect = new Kinect2(this);
  //kinect = new KinectPV2(this); // WIN
  
  // WEBCAM
  // kinect.initVideo();
  // kinect.enableColorImg(true); // WIN
  
  // DEPTH
  kinect.initDepth();
  // kinect.enableDepthImg(true); // WIN
  
  kinect.initDevice();
  // kinect.init(); // WIN
}

void draw() {
  background(0);
  
  // 1920 x 1020
  //image(kinect.getVideoImage(), 0, 0, width, height);
  //image(kinect.getColorImage(), 0, 0); // WIN
  
  image(kinect.getDepthImage(), 0, 0);
  // image(kinect.getDepthImage(), 0, 0); // WIN (SAME!)
}
