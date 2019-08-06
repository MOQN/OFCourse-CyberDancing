void setup() {
  size(600, 600);
  background(0);

  for (int i=0; i<10; i++) {
    noFill();
    stroke(255);
    strokeWeight(20 - i*2);
    float dia = i*50 + 50;
    ellipse(width/2, height/2, dia, dia);
  }
}


void draw() {
  //
}
