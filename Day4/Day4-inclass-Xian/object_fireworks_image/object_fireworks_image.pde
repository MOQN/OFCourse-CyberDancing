ArrayList<Ball> balls = new ArrayList<Ball>();
PImage img;

void setup() {
  size(400, 500);
  background(0);
  
  img = loadImage("beam.png");
  //img.resize(50, 50);
  
  for (int i=0; i<100; i++) {
    balls.add( new Ball(width/2, height) );
  }
}

void draw() {
    

  //background(0);
  fill(0, 10);
  noStroke();
  rect(0,0,width,height);
  
  for (int i=0; i<balls.size(); i++) {
    balls.get(i).move();
    balls.get(i).fall();
    balls.get(i).slowDown();
    //balls.get(i).zigzag();
    //balls.get(i).bounce();
    //balls.get(i).reappear();
    balls.get(i).display();
    if (frameCount == 80) {
      balls.get(i).explode();
    }
  }
  
  //text(balls.size(), 10 , 20);
}


void mouseDragged() {
  balls.add( new Ball(mouseX, mouseY) );
}


class Ball {
  float x;
  float y;
  float dia;
  float xSpd;
  float ySpd;
  float r, g, b;
  boolean isExploded; // a boolean variable contains only true or false value.
  
  Ball(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    dia = random(3, 15);
    xSpd = 0;
    ySpd = -10;
    r = random(255);
    g = random(255);
    b = random(255);
    isExploded = false;
  }
  
  void display() {
    //noStroke();
    //fill(r, g, b);
    //ellipse(x, y, dia, dia);
    imageMode(CENTER);
    image(img, x,y, dia, dia);
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
  void slowDown() { //***
    if (isExploded == true) {
      xSpd *= 0.97; //(97%, which means everyframe it loses its speed by 3%)
      ySpd *= 0.97;
    }
  }
  void fall() {
    ySpd += 0.14;
  }
  void explode() {
    xSpd += random(-10, 10);
    ySpd += random(-10, 10);
    isExploded = true;
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
