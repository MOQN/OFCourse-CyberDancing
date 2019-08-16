void setup() {
  size(500, 600);
  background(0); // black

  // i++;         // i = i + 1;
  // i += 5;      // i = i + 5;
  // i += 3;      // i = i + 3;
  // i += -10;    // i = i - 10;

  // i--;         // i = i - 1;
  // i -= 3;      // i = i - 3;

  // i *= 5;      // i = i * 5;
  // i /= 2;      // i = i / 2;

  // how many times?
  for (int i=0; i<5; i++) {
    int x = 10 + i*50;
    int y = height/2;
    int w = 20;
    int h = 20 + i*10;
    noStroke();
    fill(random(255), random(255), random(255));
    rect(x, y, w, h);
    println(i + " " + x);
  }
  for (int i=0; i<10; i++) {
    int h = 100 + i*5;
    stroke(255);
    line(0, h, width, h);
  }

  // range?
  // 0 to width?  0 to height?  0 to 360(angle)?  0-255(color)?
  int rectSize = 20;
  for (int y=0; y<height; y += rectSize) {
    // line!
    for (int x=0; x<width; x += rectSize) {
      noStroke();
      fill(random(255), random(255), random(255));
      
      // extra! gradation
      //float r = map(x, 0, width, 0, 255);
      //float g = map(y, 0, height, 255, 0);
      //float b = map(x, 0, width, 255, 0);
      //fill(r,g,b);
      
      rect(x, y, rectSize, rectSize);
    }
  }
}

void draw() {
  //
}
