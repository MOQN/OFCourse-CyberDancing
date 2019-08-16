ArrayList<Particle> particles = new ArrayList<Particle>();


void setup() {
  size(500, 600);
  background(0);

  generateFireworks(width/2, height, 30);
}

void draw() {
  //background(0);

  // draw background with trasparency
  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);

  // UPDATE & DISPLAY 
  for (int i=0; i<particles.size(); i++) {
    Particle p = particles.get(i); 
    p.move();
    p.fall();
    p.slowDown();
    if (keyPressed) {
      p.explode();
    }
    p.updateLifespan();
    //p.checkOutOfCanvas();
    
    // lines
    for (int j=0; j<particles.size(); j++) {
      if (i != j) {
        Particle other = particles.get(j);
        stroke(255, 100);
        line(p.x, p.y, other.x, other.y);
      }
    }
    p.display();
  }

  // REMOVE IF THE PARTICLE IS DONE
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    if (p.isDone) {
      particles.remove(i);
    }
  }


  // show the number of particles!
  fill(0, 0, 255);
  noStroke();
  //text( particles.size(), 10, 20 );
}



void mousePressed() {
  generateFireworks(mouseX, mouseY, 30);
}

void generateFireworks(float x, float y, int total) {
  float r = random(255);
  float g = random(255);
  float b = random(255);
  for (int i=0; i<total; i++) {
    particles.add( new Particle(x, y, r, g, b) );
  }
}


class Particle {
  float x, y;
  float xSpd, ySpd;
  float dia;
  float r, g, b;
  boolean isDone; // true or false
  float lifespan;
  float lifeReduction;
  boolean isExploded;

  Particle(float _x, float _y, float _r, float _g, float _b) {
    x = _x;
    y = _y;
    xSpd = 0;
    ySpd = -10; 
    dia = random(10, 20);
    r = _r;
    g = _g;
    b = _b;
    isDone = false;
    lifespan = 1.0;  // 100%
    lifeReduction = random(0.01, 0.05);
    isExploded = false;
  }
  void display() {
    pushStyle();

    fill(r, g, b, 255 * lifespan);
    noStroke();
    ellipse(x, y, dia * lifespan, dia * lifespan);

    popStyle();
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
  void fall() {
    ySpd += 0.1;
  }
  void checkOutOfCanvas() {
    if (x < 0 || x > width) {
      isDone = true;
    }
    if (y < 0 || y > height) {
      isDone = true;
    }
  }
  void updateLifespan() {
    if (lifespan > 0) {
      lifespan -= lifeReduction;
    } else {
      isDone = true;
      lifespan = 0;
    }
  }
  void explode() {
    int stength = 15;
    xSpd = random(-stength, stength);
    ySpd = random(-stength, stength);
    isExploded = true;
  }
  void slowDown() {
    if (isExploded) {
      float amount = 0.9;
      xSpd = xSpd * amount; 
      ySpd = ySpd * amount;
    }
  }
}
