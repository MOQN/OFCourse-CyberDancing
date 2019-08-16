import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

Kinect2 kinect;
PImage img;

int DISTANCE_MIN = 1;
int DISTANCE_MAX = 4499; //(4.5m)

float kinectX, kinectY;


void setup() {
  size( 512, 424 );
  background(0);

  kinect = new Kinect2(this);
  kinect.initDepth();  
  kinect.initDevice();

  img = createImage(kinect.depthWidth, kinect.depthHeight, ARGB); // MAC
  // img = createImage(KinectPV2.WIDTHDepth, KinectPV2.HEIGHTDepth); // WIN
}

void draw() {
  background(0);

  int w = kinect.depthWidth;
  int h = kinect.depthHeight;

  int[] rawDepth = kinect.getRawDepth(); // 0 - 4499 (4.5m)
  
  println( rawDepth.length ); // 217088 = 512 * 424
  // int[] rawDepth = kinect.getRawDepthData(); // WIN
  img.loadPixels();
  
  float sumX = 0;
  float sumY = 0;
  float avgX = 0;
  float avgY = 0;
  int total = 0; // counting!
  
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int index = x + y*w;
      int depth = rawDepth[index];
      // depth value 0 = error!!!
      if (depth != 0 && depth > DISTANCE_MIN && depth < DISTANCE_MAX) {
        //float brightness = map(depth, DISTANCE_MIN, DISTANCE_MAX, 255, 1);
        //img.pixels[index] = color(brightness);
        
        float r = map(depth, DISTANCE_MIN, DISTANCE_MAX, 255, 1);
        float b = map(depth, DISTANCE_MIN, DISTANCE_MAX, 1, 255);
        img.pixels[index] = color(r, 0, b);
        
        sumX += x;
        sumY += y;
        total++;
        
      } else {
        img.pixels[index] = color(0, 0);
      }
    }
  }
  
  // AVERAGE
  if (total > 0) {
    avgX = sumX / total;
    avgY = sumY / total;
    kinectX = avgX;
    kinectY = avgY;
  }
  
  img.updatePixels();
  image(kinect.getDepthImage(), 0, 0);
  image(img, 0, 0);
  
  noFill();
  stroke(0, 255, 0);
  line(0, kinectY, width, kinectY);  // H
  line(kinectX, 0, kinectX, height); // V
}


void mousePressed() {
  DISTANCE_MIN = int( map(mouseX, 0, width, 1, 4499) ); 
}
void mouseDragged() {
  DISTANCE_MAX = int( map(mouseX, 0, width, 1, 4499) ); 
}
