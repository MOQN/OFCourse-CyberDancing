Ball[] myBalls = new Ball[300];

void setup() {
  //size(500, 600);
  fullScreen();
  background(0);

  for (int i=0; i < myBalls.length; i++) {
    myBalls[i] = new Ball( random(width), random(height) );
  }
}

void draw() {
  background(0);

  for (int i=0; i < myBalls.length; i++) {
    Ball b = myBalls[i];
    b.move();
    //b.bounce();
    b.reappear();
    b.display();
  }
}














class Ball {
  float x, y;
  float xSpd, ySpd;
  float size;

  Ball(float tempX, float tempY) {
    x = tempX; // ***
    y = tempY; // ***
    xSpd = 0;
    ySpd = random(1, 3);
    size = random(5, 15);
  }
  void display() {
    noStroke();
    fill(255, 100);
    ellipse(x, y, size, size);
    fill(255);
    ellipse(x, y, size/2, size/2);
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
  void bounce() {
    if (x < 0 || x > width) {
      xSpd *= -1;
    }
    if (y < 0 || y > height) {
      ySpd = -ySpd;
    }
  }
  void reappear() {
    // x
    if (x < 0) {
      x = width;
    } else if (x > width) {
      x = 0;
    }
    // y
    if (y < 0) {
      y = height;
    } else if  (y > height) {
      y = 0;
    }
  }
  void explode() {
    int strength = 10;
    xSpd = random(-strength, strength);
    ySpd = random(-strength, strength);
  }
  void stop() {
    xSpd = 0;
    ySpd = 0;
  }
}
