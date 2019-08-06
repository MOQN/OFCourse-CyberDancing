void setup() {
  size(500, 600);
  noStroke();
}

void draw() {
  background(100);

  translate(width/2, height/2);
  
  int num = 255;
  for (int i=0; i<num; i++) {
    float angle = map(mouseX, 0, width, 10, 30);
    float distance = map(mouseY, 0, height, 0, 5);
    pushMatrix();
    rotate( radians(angle * i) );
    fill(255, i, 0);
    ellipse(i*distance, 0, i*0.5, i*0.5);
    popMatrix();
  }
}