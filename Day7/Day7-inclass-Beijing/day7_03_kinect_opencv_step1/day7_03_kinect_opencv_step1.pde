import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

Kinect2 kinect;
PImage img;

int DISTANCE_MIN = 1;
int DISTANCE_MAX = 4499;

void setup() {
  size(800, 600);
  background(0);
  
  kinect = new Kinect2(this);
  kinect.initDepth();
  kinect.initDevice();
  
  img = createImage(kinect.depthWidth, kinect.depthHeight, RGB); // blank image
}

void draw() {
  updateKinect();
  
  background(0);
  //image( kinect.getDepthImage(), 0, 0 );
  image( img, 0, 0 );
}


void updateKinect() {
  int[] rawDepth = kinect.getRawDepth();
  int w = kinect.depthWidth;
  int h = kinect.depthHeight;
  
  img.loadPixels();
  for (int y=0; y<h; y++) {
    for (int x=0; x<w; x++) {
      int index = x + y*w;
      int depth = rawDepth[index];
      if (depth != 0 && depth > DISTANCE_MIN && depth < DISTANCE_MAX) {
        float brightness = map(depth, DISTANCE_MIN, DISTANCE_MAX, 255, 0);
        img.pixels[index] = color(brightness);
      } else {
        img.pixels[index] = color(0);
      }
    }
  }
  img.updatePixels();
}

void mousePressed() {
  DISTANCE_MIN = int( map(mouseX, 0, width, 1, 4499) );
}

void mouseDragged() {
  DISTANCE_MAX = int( map(mouseX, 0, width, 1, 4499) );
}
