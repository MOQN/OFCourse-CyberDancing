// Array vs. ArrayList

// Array
// Ball[] balls = new Ball[300];
// ArrayList
// ArrayList<DataType> arrayName = new ArrayList<DataType>();

// Array                    ArrayList
// array.length             array.size()
// array[index]             array.get(i)
// arr[index] = new Obj();  array.add( new Obj() );

ArrayList<Ball> balls = new ArrayList<Ball>();


void setup() {
  size(500, 600);
  background(0);
}


void draw() {
  //background(0);

  if (mousePressed) {
    balls.add( new Ball(mouseX, mouseY) ); // add one element(object to the arrayList
  }

  for (int i=0; i<balls.size(); i++) {
    Ball b = balls.get(i); // get one element from the arrayList
    b.move();
    b.zigzag();
    //b.reappear();
    b.display();
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
    size = random(10, 20);
    xSpd = 0;//random(-0.1, 0.1);
    ySpd = random(1, 5);
    r = random(255);
    g = random(255);
    b = random(255);
  }
  void display() {
    stroke(r, g, b);
    fill(r, g, b, 100);
    ellipse(x, y, size, size);
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
