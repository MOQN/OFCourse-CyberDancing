void setup() {
  size(500, 600);
  background(100);

  colorMode(HSB, 360, 100, 100); // Hue Saturation Brightness
}

void draw() {
  background(100);
  
  pushMatrix();
  translate( width/2, height/2 );
  int angleStep = 30;
  for (int distance = 30; distance < 300; distance += 40) {
    for (int angle=0; angle<360; angle += angleStep) {
      // angle!
      pushMatrix();
      rotate( radians(angle + distance * 0.3) );

      fill(angle, 100, 100); //
      noStroke();
      ellipse(distance, 0, distance * 0.25, distance * 0.25);
      popMatrix();
    }
  }
  popMatrix();
}
