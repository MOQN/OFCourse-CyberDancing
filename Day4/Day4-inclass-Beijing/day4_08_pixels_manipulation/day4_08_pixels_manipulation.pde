PImage img; 
PImage showImg;

void setup() {
  size(500, 600);
  background(0);
  img = loadImage( "colorful.jpg" );
  showImg = createImage(img.width, img.height, RGB);
}


void draw() {
  //background(0);

  img.loadPixels();
  // you can access the entire pixels after loadPixels()!!
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int index = x  +  y*img.width; // ******
      
      color c = img.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      
      float avg = (r + g + b) / 3;
      
      if (x > width/2+100) {
        showImg.pixels[index] = color(r,0,b);  
      } else {
        showImg.pixels[index] = color(0,g,b);
      }
    }
  }
  showImg.updatePixels();
  image(showImg, 0, 0);
}
