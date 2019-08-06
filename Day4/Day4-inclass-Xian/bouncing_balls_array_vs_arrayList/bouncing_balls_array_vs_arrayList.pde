// https://processing.org/reference/ArrayList.html
// ArrayList<DataType> name = new ArrayList<DataType>();

//Ball[] balls = new Ball[100];
// total number!

ArrayList<Ball> balls = new ArrayList<Ball>();
// You don't have to define the total number of the array!

void setup() {
  size(400, 500);
  //fullScreen();
  background(0);
  for (int i=0; i<100; i++) {
    // we repeat this 100 times!
    balls.add( new Ball() );
  }
}

void draw() {
  background(0);
  
  // array: balls.length
  // arrayList: balls.size()
  
  // array: balls[i]
  // arrayList: balls.get(i)
  
  for (int i=0; i<balls.size(); i++) {
    balls.get(i).move();
    balls.get(i).zigzag();
    //balls.get(i).bounce();
    balls.get(i).reappear();
    balls.get(i).display();
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
    x = random(width);
    y = random(height);
    dia = random(3, 15);
    xSpd = 0;
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
