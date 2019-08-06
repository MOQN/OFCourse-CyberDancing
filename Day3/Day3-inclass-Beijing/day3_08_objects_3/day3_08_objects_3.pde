Ball[] myBalls = new Ball[10];
// float[] numbers = new float[10]; // how to define an array!

void setup() {
  size(500, 600);
  background(0);

  // construct balls with for-loop
  for (int i=0; i < myBalls.length; i++) {
    myBalls[i] = new Ball();
  }
}

void draw() {
  background(0);

  for (int i=0; i < myBalls.length; i++) {
    Ball b = myBalls[i];
    b.move();
    b.bounce();
    b.display();
    if (keyPressed) {
      if (key == ' ') {
        b.explode();
      } else {
        b.stop();
      }
    }
    //
  }
}














class Ball {
  float x, y;
  float xSpd, ySpd;
  float size;

  Ball() {
    x = width/2;
    y = height/2;
    xSpd = 0; //random(-5, 5);
    ySpd = 0; //random(-5, 5);
    size = random(30, 80);
  }
  void display() {
    ellipse(x, y, size, size);
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
