void setup() {
  size(500, 600);
  background(100);

  colorMode(HSB, 360, 100, 100); // Hue Saturation Brightness
}

void draw() {
  background(100);
  
  // float output = map(input, inputMin, inputMax, outputMin, outputMax);
  // you can also flip!
  // 8 = map(2, 0, 10, 10, 0);
  float angleAdj = map(mouseX, 0, width, 0.0, 0.8);
  //angleAdj = constrain(angleAdj, 0.0, 0.8); // if you would like to limit
  float sizeAdj = map(mouseY, 0, height, 0.01, 0.25);
  
  pushMatrix();
  translate( width/2, height/2 );
  int angleStep = 30;
  for (int distance = 30; distance < 300; distance += 40) {
    for (int angle=0; angle<360; angle += angleStep) {
      // angle!
      pushMatrix();
      rotate( radians(angle + distance * angleAdj) );

      fill(angle, 100, 100); //
      noStroke();
      ellipse(distance, 0, distance * sizeAdj, distance * sizeAdj);
      popMatrix();
    }
  }
  popMatrix();
}
