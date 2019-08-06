int sizeW = 1; 

void setup() {
  size(400, 500);
  background(0);
}

void draw() {
  background(0);
  
  stroke(255);
  noFill();
  
  sizeW = sizeW + 1;
  if (sizeW > 100) {
    sizeW = 1;
  }
  
  spinningEllipse(50, 50, sizeW, 50, 1);
  spinningEllipse(100, 50, sizeW, 50, 1);
  spinningEllipse(150, 50, sizeW, 50, 1);
  spinningEllipse(200, 50, sizeW, 50, 1);
  spinningEllipse(250, 50, sizeW, 50, 1);
  spinningEllipse(300, 50, sizeW, 50, 1);
  spinningEllipse(350, 50, sizeW, 50, 1);
}

void spinningEllipse(float x, float y, float w, float h, float speed) {
  pushStyle();
  pushMatrix();

  translate(x, y);
  rotate( frameCount * 0.05 * speed);
  ellipse(0, 0, w, h);
  //rect(0, 0, w, h);

  popMatrix();
  popStyle();
}







void showValues(float a, String b) {
  println("1st Value: " + a);
  println("2nd Value: " + b);
  println(a + b);
}
