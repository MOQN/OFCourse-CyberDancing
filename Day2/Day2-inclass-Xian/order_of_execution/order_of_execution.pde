void setup() {
  size(400,500);
  background(0);
  
  println("A");
}

void draw() {
  background(0);
  println("B");
  //drawRect();
  println("C");
}

void drawRect() {
  println("D");
  rect(100, 100, 200, 100);
}
