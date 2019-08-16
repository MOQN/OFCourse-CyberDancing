Ball b;

void setup() {
  size(500, 600);
  background(100);
  // create a "new" object with the class "Ball"
  b = new Ball();
}

void draw() {
  background(100);
  
  b.move();
  b.bounce();
  b.display();
}











class Ball {
  // variables(properties)
  float x, y;
  float size;
  float xSpd, ySpd;
  // There is a very very very special function called "Constructor function"
  Ball() {
    // like setup() in Processing
    x = width/2;
    y = height/2;
    size = 50;
    xSpd = random(-5, 5);
    ySpd = random(-5, 5);
  }
  // functions(methods, actions, behaviors!)
  void display() {
    ellipse(x, y, size, size);
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
  void bounce() {
    if (x < 0 || x > width) {
      xSpd = -xSpd;
    }
    if (y < 0 || y > height) {
      ySpd = -ySpd;
    }
  }
}
