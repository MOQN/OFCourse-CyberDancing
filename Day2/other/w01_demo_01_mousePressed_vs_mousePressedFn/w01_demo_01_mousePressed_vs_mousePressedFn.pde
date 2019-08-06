float dia;
color c;

void setup() {
  size(500, 600);
  noStroke();
  
  background(100);
  c = color(255);
}

void draw() {
  // try this :D
  //fill(100,10);
  //rect(0,0,width,height);
  
  dia = random(1, 15);

  fill(c);
  if (mousePressed) {
    ellipse(mouseX, mouseY, dia, dia);
  }
}

void mousePressed() {
  c = color(random(255),random(255),random(255));
}