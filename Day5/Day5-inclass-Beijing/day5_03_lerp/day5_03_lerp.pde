float x, y;

void setup() {
  size(1000, 300);
  background(0);
  x = 0;
  y = height/2;
}

void draw() {
  background(0);
  // linear interpolation
  // lerp(currPos, targetPos, %);
  x = lerp(x, width, 0.05); // 5%
  
  ellipse(x, y, 30, 30);
  
  println(x);
}
