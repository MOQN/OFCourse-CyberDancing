PImage img; 
PImage blankImg;


void setup() {
  size(500, 600);
  background(0);
  img = loadImage( "colorful.jpg" );
  blankImg = createImage(500, 600, RGB); // ARGB
}


void draw() {
  //background(0);

  blankImg.loadPixels();
  // you can access the entire pixels after loadPixels()!!
  for (int y = 0; y < blankImg.height; y++) {
    for (int x = 0; x < blankImg.width; x++) {
      int index = x  +  y*blankImg.width; // ******
      //color c = blankImg.pixels[index];
      float r = map(x, 0, blankImg.width, 0, 255);
      float g = map(mouseX, 0, blankImg.width, 255, 0);
      float b = map(y, 0, blankImg.height, 255, 0);
      blankImg.pixels[index] = color(r, g, b);
    }
  }
  blankImg.updatePixels();
  image(blankImg, 0, 0);
}
