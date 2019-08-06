// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Nov 10 2016

import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

Kinect2 kinect2;
PImage depthImg;
PImage colorImg;

Button btn;

void setup() {
  size(1000, 600, P3D);
  setupPeasyCam();
  setupGui();

  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initRegistered();
  kinect2.initDevice();

  // Blank image
  depthImg = new PImage(kinect2.depthWidth, kinect2.depthHeight, ARGB);
  
  btn = new Button(200, 200, 100);
}


void draw() {
  background(0);

  // registeredImage;
  if (registeredColor) {
    colorImg = kinect2.getRegisteredImage();
    colorImg.loadPixels();
  }
  // rawDepth value & depthImage
  int[] rawDepth = kinect2.getRawDepth();
  depthImg.loadPixels();

  for (int i=0; i < rawDepth.length; i++) {
    depthImg.pixels[i] = color(0, 0);
    if (rawDepth[i] >= thresholdMin && rawDepth[i] <= thresholdMax && rawDepth[i] != 0) {

      // get X,Y coordinates 
      int x = i % kinect2.depthWidth;
      int y = floor(i / kinect2.depthWidth);

      // change the pixel colors accoding to the depth value. Just to see the sensing area clearly.
      float r = map(rawDepth[i], thresholdMin, thresholdMax, 255, 0);
      float b = map(rawDepth[i], thresholdMin, thresholdMax, 0, 255);
      depthImg.pixels[i] = color(r, 0, b);

      btn.checkDistance(x,y);
      
      // draw PointCloud
      if (pointCloud) {
        if (x%resolution == 0 && y%resolution == 0) {
          float pX = map(x, 0, kinect2.depthWidth, -kinect2.depthWidth/2, kinect2.depthWidth/2) + offsetX;
          float pY = map(y, 0, kinect2.depthHeight, -kinect2.depthHeight/2, kinect2.depthHeight/2);
          float pZ = map(rawDepth[i], 0, 4499, 600, -600) + offsetZ;

          if (registeredColor) stroke(colorImg.pixels[i]);
          else stroke(255);
          strokeWeight(pointSize);

          point(pX, pY, pZ);
        }
      }
    }
  }
  depthImg.updatePixels();
  
  if (guiToggle) drawGui();
}

void keyPressed() {
  if (key == ' ') guiToggle = !guiToggle;
}