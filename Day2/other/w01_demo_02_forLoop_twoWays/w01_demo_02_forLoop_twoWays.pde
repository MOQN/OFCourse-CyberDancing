void setup() {
  size(500, 600);
  noStroke();  
  background(100);

  // number
  int rectSize = 50;
  for (int i=0; i<6; i++) {
    int x = rectSize * i;
    int y = height * 1/3;
    fill(random(255),random(255),random(255));
    rect(x, y, rectSize, rectSize); 
  }
  
  // range
  for (int x=0; x<width; x+=rectSize) {
    int y = height * 2/3;
    fill(random(255),random(255),random(255));
    rect(x, y, rectSize, rectSize); 
  }
}

void draw() {
  //
}