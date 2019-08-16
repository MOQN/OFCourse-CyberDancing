import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;


int DISTANCE_MIN = 0;
int DISTANCE_MAX = 4499; //4.5m


Kinect2 kinect;


void setup() {
  size(512, 424);
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
  
  stroke(255);
  noFill();
  int resolution = 5;
  for (int y=0; y<h; y += resolution) {
    beginShape();
    for (int x=0; x<w; x += resolution) {
      int index = x + y*w;
      int depth = rawDepth[index]; // 1 - 4499, 0: error
      if (depth != 0 && depth > DISTANCE_MIN && depth < DISTANCE_MAX) {
        float yAdj = map(depth, DISTANCE_MIN, DISTANCE_MAX, 0, 100);
        yAdj = constrain(yAdj, 0, 100);
        curveVertex(x, y+yAdj);
      }
    }
    endShape();
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
