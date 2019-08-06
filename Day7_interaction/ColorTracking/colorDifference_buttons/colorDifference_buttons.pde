// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Sep 21 2016


import processing.video.*;


Capture cam;
PImage prevCam;
PImage img;

Button btn;


void setup() {
  size(640, 480);

  cam = new Capture(this, 640, 480);
  cam.start();

  prevCam = createImage(cam.width, cam.height, RGB);
  img = createImage(cam.width, cam.height, RGB);
  
  btn = new Button( width * 0.2, height/2, 50 );
}


void draw() {
  if (cam.available()) {
    cam.read();

    cam.loadPixels();
    prevCam.loadPixels();

    int h = cam.height;
    int w = cam.width;

    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        int i =  x + y*w; // IMPORTANT

        float currR = red(cam.pixels[i]);
        float currG = green(cam.pixels[i]);
        float currB = blue(cam.pixels[i]);

        float prevR = red(prevCam.pixels[i]);
        float prevG = green(prevCam.pixels[i]);
        float prevB = blue(prevCam.pixels[i]);

        float diffR = abs(currR - prevR);
        float diffG = abs(currG - prevG);
        float diffB = abs(currB - prevB);

        float diffSum = diffR + diffG + diffB;
        float threshold = 50;
        if (diffSum > threshold) { 
          img.pixels[i] = color(255);
          
          btn.checkDistance(x, y);                   // ***
          
        } else {
          img.pixels[i] = color(0);
        }
      }
    }

    img.updatePixels();

    prevCam = cam.copy();
  }
  
  //image(cam, 0, 0);
  image(img, 0, 0);
  
  
  // button
  btn.updateHitState();
  btn.display();
  
}