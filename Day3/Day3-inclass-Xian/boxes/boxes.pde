ArrayList<Box> boxes = new ArrayList<Box>();

void setup() {
  size(600,600);
  background(0);
}

void draw() {
  //background(0);
  fill(0, 30);
  noStroke();
  rect(0,0, width, height);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount * 0.02);
  boxes.add( new Box(mouseX-width/2, mouseY-height/2, 10) );
  for (int i=0; i<boxes.size(); i++) {
    Box b = boxes.get(i);
    b.update();
    b.display();
  }
  popMatrix();
}

class Box {
  float x;
  float y;
  float size;
  
  Box(float _x, float _y, float _size) {
    x = _x;
    y = _y;
    size = _size;
  }
  void update() {
    size += 10;
  }
  void display() {
    pushStyle();
    noFill();
    stroke(255);
    rectMode(CENTER);
    rect(x,y,size,size);
    popStyle();
  }
}
