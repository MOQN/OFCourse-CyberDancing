import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;


int DISTANCE_MIN = 500;
int DISTANCE_MAX = 1200;


Kinect2 kinect;
PImage depthImg;


float kinectX, kinectY;


void setup() {
  size(512, 424);
  background(0);
  
  kinect = new Kinect2(this);  
  kinect.initDepth();
  kinect.initDevice();
  
  // blank Image
  depthImg = createImage(kinect.depthWidth, kinect.depthHeight, ARGB);
}

void draw() {
  background(0);
  
  int[] rawDepth = kinect.getRawDepth(); // 0 - 4499
  // println(rawDepth.length); // 217088 = 512 * 424
  
  
  float sumX = 0;
  float sumY = 0;
  float avgX = 0;
  float avgY = 0;
  int count = 0;
  
  int w = kinect.depthWidth;
  int h = kinect.depthHeight;
  depthImg.loadPixels();
  for (int y=0; y<h; y++) {
    for (int x=0; x<w; x++) {
      int index = x + y*w;
      int depth = rawDepth[index]; // 1 - 4499, 0: error

      if (depth != 0 && depth > DISTANCE_MIN && depth < DISTANCE_MAX) {
        float r = map(depth, DISTANCE_MIN, DISTANCE_MAX, 255, 0);
        float b = map(depth, DISTANCE_MIN, DISTANCE_MAX, 0, 255);
        depthImg.pixels[index] = color(r,0,b);
        sumX += x;
        sumY += y;
        count++;
      } else {
        depthImg.pixels[index] = color(0, 0); // transparent
      }
    }
  }
  depthImg.updatePixels();
  
  if (count > 0) {
    avgX = sumX / count;
    avgY = sumY / count;
    kinectX = lerp(kinectX, avgX, 0.1);
    kinectY = lerp(kinectY, avgY, 0.1);
  }
  
  image( kinect.getDepthImage(), 0, 0);
  image( depthImg, 0, 0 );
  
  pushStyle();
  stroke(0, 255, 0);
  line(kinectX, 0, kinectX, height);
  line(0, kinectY, width, kinectY);
  popStyle();
  
}



void mousePressed() {
  DISTANCE_MIN = int( map(mouseY, 0, height, 0, 4499) );
}

void mouseDragged() {
  DISTANCE_MAX = int( map(mouseY, 0, height, 0, 4499) );
}

void mouseReleased() {
  println(DISTANCE_MIN + " | " + DISTANCE_MAX);
  
}
