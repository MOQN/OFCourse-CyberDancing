import processing.video.*;

Capture cam;
PImage showImg;

void setup() {
  size(640, 480);
  background(0);
  showImg = createImage(640, 480, RGB);
  
  cam = new Capture(this, 640, 480);
  cam.start();
}


void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }
  //background(0);

  
  // you can access the entire pixels after loadPixels()!!
  for (int y = 0; y < cam.height; y++) {
    for (int x = 0; x < cam.width; x++) {
      int index = x  +  y*cam.width; // ******
      
      color c = cam.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      
      float avg = (r + g + b) / 3;
      
      if (x > width/2) {
        if (avg > 100) {
          showImg.pixels[index] = color(255);
        } else {
          showImg.pixels[index] = color(0);
        }
      } else {
        showImg.pixels[index] = color(avg);
      }
    }
  }
  showImg.updatePixels();
  image(showImg, 0, 0);
}
