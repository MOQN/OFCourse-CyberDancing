Ball a;
Ball b;
int num;

void setup() {
  size(500, 600);
  background(100);
  a = new Ball();
  b = new Ball();
  num = 10;
}

void draw() {
  background(100);

  a.move();
  a.bounce();
  a.display();
  
  b.move();
  b.bounce();
  b.display();
}











class Ball {
  // variables(properties)
  float x, y;
  float size;
  float xSpd, ySpd;
  float r, g, b;
  // There is a very very very special function called "Constructor function"
  Ball() {
    // like setup() in Processing
    x = width/2;
    y = height/2;
    size = 50;
    xSpd = random(-5, 5);
    ySpd = random(-5, 5);
    r = random(255);
    g = random(255);
    b = random(255);
  }
  // functions(methods, actions, behaviors!)
  void display() {
    noStroke();
    fill(r, g, b);
    ellipse(x, y, size, size);
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
  void bounce() {
    if (x < 0 || x > width) {
      xSpd = -xSpd;
      r = random(255);
      g = random(255);
      b = random(255);
    }
    if (y < 0 || y > height) {
      ySpd = -ySpd;
      r = random(255);
      g = random(255);
      b = random(255);
    }
  }
}
