import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

int DISTANCE_MIN = 1;
int DISTANCE_MAX = 4499;

Kinect2 kinect;
PImage img;


void setup() {
  size(512, 424); 
  background(0);

  kinect = new Kinect2(this);
  kinect.initDepth();
  kinect.initDevice(); //**

  img = createImage( kinect.depthWidth, kinect.depthHeight, ARGB);
}


void draw() {
  background(0);
  
  int w = kinect.depthWidth;
  int h = kinect.depthHeight;
  
  int[] rawDepth = kinect.getRawDepth(); // length = w * h
  img.loadPixels();
  for (int y=0; y<h; y++) {
    for (int x=0; x<w; x++) {
      int index = x + y*w;   // ***
      // img.pixels[index];  // 0 - 255
      // rawDepth[index];    // 0 - 4499 (0m to 4.5m)
      int depth = rawDepth[index]; 
      if (depth != 0 && depth > DISTANCE_MIN && depth < DISTANCE_MAX) {
        // depth area we use!
        float bri = map(depth, DISTANCE_MIN, DISTANCE_MAX, 255, 0);
        img.pixels[index] = color(bri); // brightness
      } else {
        img.pixels[index] = color(0, 0); // transparent
      }
    }
  }
  img.updatePixels();

  //image( kinect.getDepthImage(), 0, 0 );
  image( img, 0, 0 );
}

void mousePressed() {
  DISTANCE_MIN = int( map(mouseY, height, 0, 1, 4499) );
}

void mouseDragged() {
  DISTANCE_MAX = int( map(mouseY, height, 0, 1, 4499) );
}

void mouseReleased() {
  println( DISTANCE_MIN + " | " + DISTANCE_MAX );
}
