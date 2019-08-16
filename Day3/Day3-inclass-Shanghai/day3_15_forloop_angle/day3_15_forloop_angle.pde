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
  for (int angle=0; angle<360; angle += 10) {
    pushMatrix();
    rotate( radians(angle) );
    noStroke();
    fill(angle, 100, 100); //(Hue, Sat, Bri)
    ellipse(150, 0, 30, 30);
    popMatrix();
  }
  popMatrix();
  
  popStyle();
  
}
