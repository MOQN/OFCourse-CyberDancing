//DataType[] name = new DataType[totalNumber];
Ball[] balls = new Ball[100];

void setup() {
  size(400, 500);
  background(0);

  // construct the objects with the class
  for (int i=0; i<balls.length; i++) {
    balls[i] = new Ball();
  }
  //balls.length = the total number of the array!
}


void draw() {
  background(0);
  // update
  // check
  // display
  for (int i=0; i<balls.length; i++) {
    balls[i].move();
    balls[i].bounce();
    balls[i].display();
  }
}










class Ball {
  // variables (properties)
  float x;
  float y;
  float dia;
  float xSpd;
  float ySpd;
  float r, g, b;
  // very very very special function
  // Constructor! (setup of the class)
  Ball() {
    x = width/2;
    y = height/2;
    dia = 30;
    xSpd = random(-5, 5);
    ySpd = random(-5, 5);
    r = random(255);
    g = random(255);
    b = random(255);
  }
  // you can add any functions! (actions or behaviors)
  void display() {
    noStroke();
    fill(r, g, b);
    ellipse(x, y, dia, dia);
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
      ySpd *= -1;
    }
  }
}
