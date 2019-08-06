ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {
  size(400, 500);
  background(0);
  
  for (int i=0; i<30; i++) {
    balls.add( new Ball(width/2, height) );
  }
}

void draw() {
  background(0);
  //fill(0, 255);
  //noStroke();
  //rect(0,0,width,height);
  
  for (int i=0; i<balls.size(); i++) {
    balls.get(i).move();
    balls.get(i).fall();
    balls.get(i).slowDown();
    //balls.get(i).zigzag();
    //balls.get(i).bounce();
    //balls.get(i).reappear();
    //balls.get(i).display();
    if (frameCount == 80) {
      balls.get(i).explode();
    }
    else if (frameCount == 120) {
      balls.get(i).explode();
    }
    else if (frameCount == 130) {
      balls.get(i).explode();
    }
    for (int j=0; j<balls.size(); j++) {
      stroke(255,30);
      line(balls.get(i).x, balls.get(i).y, balls.get(j).x, balls.get(j).y);
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
    dia = 3;
    xSpd = 0;
    ySpd = -10;
    r = 255;
    g = 255;
    b = 250;
    isExploded = false;
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
  void slowDown() { //***
    if (isExploded == true) {
      xSpd *= 0.9; //(97%, which means everyframe it loses its speed by 3%)
      ySpd *= 0.9;
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
