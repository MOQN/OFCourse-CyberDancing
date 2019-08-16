import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

Kinect2 kinect;

int DISTANCE_MIN = 1;
int DISTANCE_MAX = 4499; //(4.5m)

float kinectX, kinectY;


void setup() {
  //size( 512, 424, P3D );
  fullScreen(P3D);
  background(0);

  kinect = new Kinect2(this);
  kinect.initDepth();
  kinect.initRegistered();
  kinect.initDevice();
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  rotateY( frameCount * 0.01 );
  
  int w = kinect.depthWidth;
  int h = kinect.depthHeight;

  int[] rawDepth = kinect.getRawDepth(); // 0 - 4499 (4.5m)
 
  stroke(255);
  strokeWeight(2);
  int res = 2;
  for (int y = 0; y < h; y += res) {
    for (int x = 0; x < w; x += res) {
      int index = x + y*w;
      int depth = rawDepth[index];
      
      if (depth != 0 && depth > DISTANCE_MIN && depth < DISTANCE_MAX) {
        float x3D = map(x, 0, w, -w/2, w/2);
        float y3D = map(y, 0, h, -h/2, h/2);
        float z3D = map(depth, 0, 4499, 500, -500);
        point(x3D, y3D, z3D);
      }
    }
  }
  
}


void mousePressed() {
  DISTANCE_MIN = int( map(mouseX, 0, width, 1, 4499) ); 
}
void mouseDragged() {
  DISTANCE_MAX = int( map(mouseX, 0, width, 1, 4499) ); 
}
