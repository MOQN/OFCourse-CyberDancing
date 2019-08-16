Ball[] balls = new Ball[300];
//DataType[] nameArray = new DataType[ TotalNum ];

void setup() {
  fullScreen();
  //size(500, 600);
  background(0);

  for (int i=0; i<balls.length; i++) {
    float x = random(width);
    float y = random(height);
    balls[i] = new Ball(x, y);
  }
}

void draw() {
  background(0);

  for (int i=0; i<balls.length; i++) {
    balls[i].move();
    balls[i].zigzag();
    balls[i].reappear();
    balls[i].display();
  }
}











class Ball {
  float x, y;
  float xSpd, ySpd;
  float size;
  float r, g, b;
  Ball(float _x, float _y) {
    x = _x;
    y = _y;
    size = random(2, 10);
    xSpd = 0;//random(-10, -1);
    ySpd = random(0.5, 5);
    r = random(255);
    g = random(255);
    b = random(255);
  }
  void display() {
    //stroke(r, g, b);
    fill(255, 100);
    ellipse(x, y, size, size);
    ellipse(x, y, size/2, size/2);
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
  void zigzag() {
    x += random(-1, 1);
    y += random(-1, 1);
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
