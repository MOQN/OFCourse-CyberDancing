void setup() {
  size(500, 600);
  background(100);

  /* while loop
   int number = 0;
   while (number < 10) {
   println( number );
   number = number + 1;
   }
   */

  // i++      // i = i + 1;
  // i += 5   // i = i + 5;
  // i--      // i = i - 1;
  // i -= 3   // i = i - 5;
  // i *= 2   // i = i * 5;

  // from while loop!
  // int number = 0; number < 10; number = number + 1;

  /*
  for (from; until; increment) {
   // let's repeat!
   }
   */

  for (int i=0; i<5; i++) {
    println(i);
  }

  // how many times would you like to repeat?
  /*
  for (int i=0; i<10; i++) {
   float x = i * 30;
   float y = 10;
   int size = i + 10;
   rect(x, y, size, size);
   }
   */

  // range!
  /*
  // grid on only x-axis
  int rectSize = 50;
   for (int x=0; x<width; x += rectSize) {
   noStroke();
   fill(random(255),random(255),random(255));
   rect(x, 0, rectSize, rectSize);
   }
   */
  /*
  // grid on the entire cavnas
  int rectSize = 50;
  for (int y=0; y<height; y += rectSize) {
    for (int x=0; x<width; x += rectSize) {
      noStroke();
      fill(random(255), random(255), random(255));
      rect(x, y, rectSize, rectSize);
    }
  }
  */
  
  // range! angle!
  
  //colorMode(RGB, 255, 255, 255);
  colorMode(HSB, 360, 100, 100); // Hue Saturation Brightness
  
  pushMatrix();
  translate( width/2, height/2 );
  int angleStep = 5; 
  for (int angle=0; angle<360; angle += angleStep) {
    // angle!
    pushMatrix();
    rotate( radians(angle) );
    
    fill(angle, 100, 100); //
    stroke(angle, 100, 100); //
    
    line(0, 0, 150, 0);
    ellipse(150, 0, 50, 50);
    popMatrix();
  }
  popMatrix();
}

void draw() {
  //
}
