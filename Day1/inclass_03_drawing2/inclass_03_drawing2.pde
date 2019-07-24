float r;
float g;
float b;

void setup() {
  size(400, 500);
  background(255);

  r = random(255);
  g = random(255);
  b = random(255);
}

void draw() {
  // display the color
  noStroke();
  fill(r, g, b);
  rect(5, 5, 10, 10);
}

void mouseDragged() {
  noStroke();
  //fill(r, g, b);
  //ellipse(mouseX, mouseY, 30, 30);
  stroke(r, g, b);
  strokeWeight(30);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

//void mouseReleased() {
  //r = random(255);
  //g = random(255);
  //b = random(255);
//}

void keyPressed() {
  if (key == ' ') {
    background(255);  
  }
  if (key == 'r') {
    r = 255;
    g = 0;
    b = 0;
  }
  if (key == 'g') {
    r = 0;
    g = 255;
    b = 0;
  }
  if (key == 'b') {
    r = 0;
    g = 0;
    b = 255;
  }
  
  // try to choose better colors!
  // https://www.color-hex.com/
}
