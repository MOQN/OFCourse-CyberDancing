PImage img;

void setup() {
  size(500, 500);
  background(0);
  img = loadImage("colorful.JPG");
}

void draw() {
  for (int i=0; i<1000; i++) {
    int x = int( random(img.width) );
    int y = int( random(img.height) );
    float dia = random(3, 6);
    color c = img.get(x, y); // get the pixel value(color) with x and y 
    fill(c);
    noStroke();
    rect(x, y, dia, dia);
  }
}

void mousePressed() {
  color c = img.get(mouseX, mouseY);
  float r = red(c);
  float g = green(c);
  float b = blue(c);

  println(r + " " + g + " " + b);
}
