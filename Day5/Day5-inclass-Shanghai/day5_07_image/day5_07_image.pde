PImage img;

void setup() {
  size(500, 500);
  background(0);
  
  // ( filepath ) ( "folderName/filename.extension" ) Case Sensitive!!
  img = loadImage("colorful.JPG");
  
  //img.resize(300, 300);
  // you can resize the image source
  // however, the best way is resizing the image file itself!!
  
}

void draw() {
  //background(0);
  
  //image( img, 0, 0 ); // (imgVal, x, y);
  //image( img, 0, 0, width, height ); // (imgVal, x, y, w, h);
  
  //imageMode(CENTER);
  //image( img, mouseX, mouseY, 200, 200 );
  
  //float g = map(mouseX, 0, width, 0, 255);
  tint( 255, 255, 255 );
  
  image( img, 0, 0 );
  
  //filter(INVERT);
  //filter(BLUR, 3);
  //filter(GRAY);
  //filter(THRESHOLD, 0.5); //%
}
