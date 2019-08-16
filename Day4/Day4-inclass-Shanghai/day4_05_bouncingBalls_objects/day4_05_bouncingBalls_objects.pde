Ball b;


void setup() {
  size(500, 600);
  background(100);
  // create a "new" object with the class "Ball"
  b = new Ball();
  
  // println(b.x);
}

void draw() {
  background(100);
  b.display();
}











class Ball {
  // variables(properties)
  float x, y;
  float size;
  // There is a very very very special function called "Constructor function"
  Ball() {
    // like setup() in Processing
    x = width/2;
    y = height/2;
    size = 50;
  }
  // functions(methods, actions, behaviors!)
  void display() {
    ellipse(x, y, size, size);
  }
}
