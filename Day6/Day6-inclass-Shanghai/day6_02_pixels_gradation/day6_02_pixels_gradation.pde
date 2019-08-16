PImage img;

void setup() {
  size(500, 600);
  background(0);

  //img = loadImage("filename.ext");
  // create a blank image
  img = createImage(width, height, RGB); // ARGB
}


void draw() {
  background(0);

  //img.get(x,y); //only one pixel!

  img.loadPixels();
  // play with the pixels
  for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      int index = x + y*img.width; // ***
      float r = map(x, 0, width, 255, 0);
      float g = map(mouseX, 0, width, 0, 255);
      float b = map(y, 0, height, 0, 255);
      img.pixels[index] = color(r, g, b);
    }
  }
  img.updatePixels();
  image( img, 0, 0 );
}
