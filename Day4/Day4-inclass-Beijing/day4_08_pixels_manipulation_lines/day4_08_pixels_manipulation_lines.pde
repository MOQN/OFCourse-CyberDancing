PImage img; 

void setup() {
  size(500, 600);
  background(0);
  img = loadImage( "colorful.jpg" );
}


void draw() {
  background(0);

  stroke(255);
  noFill();
  int pitch = 10;
  img.loadPixels();
  // you can access the entire pixels after loadPixels()!!
  for (int y = 0; y < img.height; y+=pitch) {
    beginShape();
    for (int x = 0; x < img.width; x+=pitch) {
      int index = x  +  y*img.width; // ******

      color c = img.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);

      float avg = (r + g + b) / 3;
      float mappedPitch = map(avg, 0, 255, 0, pitch);

      curveVertex(x,y+mappedPitch);
    }
    endShape();
  }
}
