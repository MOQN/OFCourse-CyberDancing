ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {
  size(400, 500);
  background(0);
  
  //for (int i=0; i<100; i++) {
  //  balls.add( new Ball() );
  //}
}

void draw() {
  background(0);
  
  // generate particles every frame!!!
  // balls.add( new Ball(mouseX, mouseY) );
  
  for (int i=0; i<balls.size(); i++) {
    balls.get(i).move();
    //balls.get(i).zigzag();
    //balls.get(i).bounce();
    //balls.get(i).reappear();
    balls.get(i).display();
    if (keyPressed == true) {
      balls.get(i).explode();
    }
  }
  
  text(balls.size(), 10 , 20);
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
  
  Ball(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    dia = random(3, 15);
    xSpd = random(-0.1, 0.1);
    ySpd = random(-0.1, 0.1);
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
  void explode() {
    xSpd += random(-10, 10);
    ySpd += random(-10, 10);
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
