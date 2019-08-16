void setup() {
  size(500, 600);
  background(100);
}

void draw() {
  background(100);

  pushStyle();
  //colorMode(RGB, 255, 255, 255); // default
  colorMode(HSB, 360, 100, 100); 

  pushMatrix();
  translate(width/2, height/2);
  for (int distance = 50; distance < 300; distance += 50) {
    for (int angle=0; angle<360; angle += 15) {
      float adj = map(mouseX, 0, width, 0, 0.005);
      pushMatrix();      
      rotate( radians(angle) + distance * adj );
      
      noStroke();
      fill(angle, 100, 100); //(Hue, Sat, Bri)
      
      float size = map(distance , 50, 300, 10, 50);
      ellipse(distance, 0, size, size);
      popMatrix();
    }
  }
  popMatrix();

  popStyle();
}
