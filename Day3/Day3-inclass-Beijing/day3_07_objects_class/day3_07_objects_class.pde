Ball myBall;

void setup() {
  size(500, 600);
  background(0);
  
  myBall = new Ball();
}

void draw() {
  background(0);
  
  myBall.display();
}














// "Ball"is a DataType now!
class Ball {
  // variables, properties ( fields(CS) ) 
  float x, y;
  float xSpd, ySpd;
  float size;
  // very very very special function called "constructor"
  Ball() {
    // like setup() in Processing
    x = width/2;
    y = height/2;
    xSpd = random(-5, 5);
    ySpd = random(-5, 5);
    size = random(30, 80);
  }
  // functions, behaviors, actions ( methods(CS) )
  void display() {
    // like draw() in Processing
    ellipse(x, y, size, size);
  }
}
