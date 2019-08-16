class Particle {
  float x, y;
  float xSpd, ySpd;
  float size;
  float r, g, b;
  float rotSpeed;
  Particle(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    xSpd = 0;//random(-0.1, 0.1);
    ySpd = random(0.1, 0.3);
    size = random(10, 20);
    r = random(255);
    g = random(255);
    b = random(255);
    rotSpeed = random(0.01, 0.04);
  }
  void display() {
    pushMatrix();
    
    translate(x,y);
    rotate(frameCount * rotSpeed);
    
    noStroke();
    //fill(r,g,b);
    noFill();
    stroke(r, g, b, 100);
    //ellipse(x, y, size, size);
    rectMode(CENTER);
    rect(0, 0,size, size);
    
    popMatrix();
  }
  void getBigger() {
    //size += 3;
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
}
