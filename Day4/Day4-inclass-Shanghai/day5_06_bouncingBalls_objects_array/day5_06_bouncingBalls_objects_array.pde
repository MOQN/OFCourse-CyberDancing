Ball[] balls = new Ball[100];
//DataType[] nameArray = new DataType[ TotalNum ];

void setup() {
  //fullScreen();
  size(500, 600);
  background(100);

  for (int i=0; i<balls.length; i++) {
    float x = random(width);
    float y = random(height);
    balls[i] = new Ball(x, y);
  }
}

void draw() {
  background(100);

  for (int i=0; i<balls.length; i++) {
    balls[i].move();
    balls[i].reappear();
    balls[i].display();
  }
}











class Ball {
  float x, y;
  float xSpd, ySpd;
  float size;
  Ball(float a, float b) {
    x = a;
    y = b;
    size = random(10, 150);
    xSpd = random(-5, -1);
    ySpd = random(-1, -0.5);
  }
  void display() {
    ellipse(x, y, size, size);
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
  void reappear() {
    if (x < 0) {
      x = width;
    } else if (x > width) {
      x = 0;
    }
    if (y < 0) {
      y = height;
    } else if (y > height) {
      y = 0;
    }
  }
}
