ArrayList<Snow> snowflakes = new ArrayList<Snow>();

void setup() {
  size(400, 500);
  background(0);
  
  for (int i=0; i<300; i++) {
    snowflakes.add( new Snow(random(width), random(-200, 0)) );
  }
}

void draw() {
  background(0);
  
  

  for (int i=0; i<snowflakes.size(); i++) {
    Snow s = snowflakes.get(i);
    s.fall();
    s.reappear();
    s.display();
  }
}




class Snow {
  float x;
  float y;
  float size;
  float xSpd;
  float ySpd;
  
  Snow(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    size = random(5, 10);
    xSpd = 0;
    ySpd = random(1, 3);
  }
  
  void display() {
    pushStyle();
  
    noStroke();
    fill(255,100);
    ellipse(x, y, size, size);
    fill(255);
    ellipse(x, y, size/2, size/2);

    popStyle();
  }
  void fall() {
    x += random(-1, 1);
    y += ySpd; // y = y + ySpd;
  }
  void reappear() {
    if (y > height) {
      y = 0;
    }
  }
}
