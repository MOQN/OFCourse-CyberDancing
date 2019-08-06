import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;


Kinect2 kinect;


void setup() {
  size(512, 424); // the width and height of KinectV2's depth image
  background(0);
  
  kinect = new Kinect2(this);
  //kinect.initVideo();
  
  //kinect.initRegistered();
  //kinect.getRegisteredImage();
  
  kinect.initDepth();
  
  kinect.initDevice();
}

void draw() {
  background(0);
  
  // image( kinect.getVideoImage(), 0, 0 );
  // println(kinect.colorWidth); // 1920
  // println(kinect.colorHeight); // 1080
  
  image( kinect.getDepthImage(), 0, 0);
  println(kinect.depthWidth);
  println(kinect.depthHeight);
  
  //color: 0 - 255, rawDepth 0 - 4499 (0.5 - 4.5m)
  
  
}
