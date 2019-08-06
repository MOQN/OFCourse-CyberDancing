import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;


int DISTANCE_MIN = 0;
int DISTANCE_MAX = 4499; //4.5m


Kinect2 kinect;


void setup() {
  fullScreen(P3D);
  //size(512, 424, P3D);
  background(0);

  kinect = new Kinect2(this);  
  kinect.initDepth();
  kinect.initDevice();
}

void draw() {
  background(0);

  int[] rawDepth = kinect.getRawDepth(); // 0 - 4499

  int w = kinect.depthWidth;
  int h = kinect.depthHeight;


  translate(width/2, height/2, -300);
  scale(1.5);
  rotateY(frameCount * 0.01);
  
  stroke(255);
  noFill();
  int resolution = 2;
  for (int y=0; y<h; y += resolution) {
    for (int x=0; x<w; x += resolution) {
      int index = x + y*w;
      int depth = rawDepth[index]; // 1 - 4499, 0: error

      if (depth != 0 && depth > DISTANCE_MIN && depth < DISTANCE_MAX) {
        float newX = map(x, 0, w, -w/2, w/2);
        float newY = map(y, 0, h, -h/2, h/2);
        float newZ = map(depth, 0, 4499, 500, -500);
        point(newX, newY, newZ);
      }
    }
  }
  //image( kinect.getDepthImage(), 0, 0);
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
