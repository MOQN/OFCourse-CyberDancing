//DataType name = value;
Ball b;

void setup() {
  size(400, 500);
  background(0);
  
  b = new Ball();
  // variable(memorySpace) <== construct an object with the class!
}


void draw() {
  background(0);
  // update
  // check
  // display
  b.move();
  b.bounce(); // if statement!
  b.display();
}










class Ball {
  // variables (properties)
  float x;
  float y;
  float dia;
  float xSpd;
  float ySpd;
  // very very very special function
  // Constructor! (setup of the class)
  Ball() {
    x = width/2;
    y = height/2;
    dia = 30;
    xSpd = random(-5, 5);
    ySpd = random(-5, 5);
  }
  // you can add any functions! (actions or behaviors)
  void display() {
    ellipse(x,y, dia, dia);
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
