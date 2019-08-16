import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

float kinectX, kinectY;

int DISTANCE_MIN = 1;
int DISTANCE_MAX = 4499;

Kinect2 kinect;
PImage img;
PImage colorImg;


void setup() {
  //size(512, 424, P3D);
  fullScreen(P3D);
  background(0);

  kinect = new Kinect2(this);
  kinect.initDepth();
  kinect.initRegistered();
  kinect.initDevice(); //**

  img = createImage( kinect.depthWidth, kinect.depthHeight, ARGB);
  colorImg = createImage( kinect.depthWidth, kinect.depthHeight, ARGB);
}


void draw() {
  background(0);
  
  // 3D
  pushMatrix();
  translate(width/2, height/2);
  //rotateY( frameCount * 0.01 );
  
  int w = kinect.depthWidth;
  int h = kinect.depthHeight;
  
  colorImg = kinect.getRegisteredImage().copy();
  colorImg.loadPixels();
  
  
  int res = 3;
  strokeWeight(res*1.5);
  int[] rawDepth = kinect.getRawDepth(); // length = w * h
  img.loadPixels();
  for (int y=0; y<h; y += res) {
    for (int x=0; x<w; x += res) {
      int index = x + y*w;   // ***
      // img.pixels[index];  // 0 - 255
      // rawDepth[index];    // 0 - 4499 (0m to 4.5m)
      int depth = rawDepth[index]; 
      if (depth != 0 && depth > DISTANCE_MIN && depth < DISTANCE_MAX) {
        // depth area we use!
        float r = map(depth, DISTANCE_MIN, DISTANCE_MAX, 255, 0);
        float b = map(depth, DISTANCE_MIN, DISTANCE_MAX, 0, 255);
        img.pixels[index] = color(r, 0, b);
        
        // x, y, depth --- map() ---> x3D, y3D, z3D 
        color c = colorImg.pixels[index];
        
        float x3D = map(x, 0, w, -w/2, w/2);
        float y3D = map(y, 0, h, -h/2, h/2);
        float z3D = map(depth, 0, 4499, 500, -500);
        stroke(c);
        point(x3D, y3D, z3D);
      } else {
        img.pixels[index] = color(0, 0); // transparent
      }
    }
  }
  img.updatePixels();
  popMatrix();

  // 2D
  pushMatrix();
  scale(0.3); //30%
  image( kinect.getDepthImage(), 0, 0 );
  image( img, 0, 0 );
  popMatrix();
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
