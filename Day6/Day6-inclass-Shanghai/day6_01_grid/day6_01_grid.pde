void setup() {
  size(500, 600);
  background(0);
  int count = 0;
  int res = 50;
  for (int y=0; y<height; y+=res) {
    for (int x=0; x<width; x+=res) {
      fill(random(255), random(255), random(255));
      noStroke();
      rect(x, y, res, res);
      fill(255);
      text( count, x+10, y+20 );
      count++;
    }
  }
}


void draw() {
  //background(0);
}
