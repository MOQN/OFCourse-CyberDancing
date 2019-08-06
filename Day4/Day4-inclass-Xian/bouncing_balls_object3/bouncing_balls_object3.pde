Ball[] balls = new Ball[100];

void setup() {
  //size(400, 500);
  fullScreen();
  background(0);
  for (int i=0; i<balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(0);
  for (int i=0; i<balls.length; i++) {
    balls[i].move();
    balls[i].zigzag();
    //balls[i].bounce();
    balls[i].reappear();
    balls[i].display();
  }
}










class Ball {
  float x;
  float y;
  float dia;
  float xSpd;
  float ySpd;
  float r, g, b;
  
  Ball() {
    x = width/2;
    y = height/2;
    dia = random(1, 5);
    xSpd = random(-3, -1);
    ySpd = random(1, 2);
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  void display() {
    noStroke();
    fill(r, g, b);
    ellipse(x, y, dia, dia);
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
  void zigzag() {
    x += random(-2,2);
    //y += random(-2,2);
  }
  void bounce() {
    if (x < 0 || x > width) {
      xSpd *= -1;
    }
    if (y < 0 || y > height) {
      ySpd *= -1;
    }
  }
  void reappear() {
    // x!
    if (x < 0) {
      x = width;
    }
    else if (x > width) {
      x = 0;
    }
    // y!
    if (y < 0) {
      y = height;
    }
    else if (y > height) {
      y = 0;
    }
  }
}
