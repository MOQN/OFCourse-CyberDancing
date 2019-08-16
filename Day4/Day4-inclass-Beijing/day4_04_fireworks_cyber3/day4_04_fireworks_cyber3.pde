//ArrayList<DataType> name = new ArrayList<DataType>();
ArrayList<Particle> fireworks = new ArrayList<Particle>();

void setup() {
  size(500, 600);
  background(0);
}

void draw() {
  background(0);
  
  // How to draw background with transparency
  //noStroke();
  //fill(0, 10);
  //rect(0, 0, width, height);
  
  // update & display
  for (int index = 0; index < fireworks.size(); index++) {
    Particle f = fireworks.get(index);
    f.move();
    //f.fall();
    f.slowDown();
    //f.checkOutOfCanvas();
    f.checkLifespan();
    f.display();
    
    // lines?
    for (int otherIndex = 0; otherIndex < fireworks.size(); otherIndex++) {
      if (index != otherIndex) {
        Particle otherF = fireworks.get(otherIndex);
        float distance = dist(f.x, f.y, otherF.x, otherF.y);
        if (distance > 10 && distance < 80) {
          float alpha = map(distance, 0, 80, 255, 0);
          stroke(255, alpha);
          line(f.x, f.y, otherF.x, otherF.y);  
        }
      }
    }

    if (keyPressed) {
      f.explode();
    }
  }
  
  // if the particle is done, remove from the arrayList
  for (int i = fireworks.size()-1; i >= 0; i--) {
    Particle f = fireworks.get(i);
    if (f.isDone) {
      fireworks.remove(i);
    }
  }
  
  //text( fireworks.size(), 10, 20 );
}

void mouseDragged() {
  fireworks.add( new Particle(mouseX, mouseY) );
}









class Particle {
  float x, y;
  float xSpd, ySpd;
  float size;
  boolean isDone; // true or false
  float lifespan;
  float lifeReduction;
  boolean isExploded;
  color clr;

  Particle(float _x, float _y) {
    x = _x;
    y = _y;
    size = random(3, 5);
    xSpd = random(-1, 1);
    ySpd = random(-1, 1);
    isDone = false;
    lifespan = 1.0; // 100%
    lifeReduction = 0; //random(0.003, 0.008);
    isExploded = false;
    clr = color( 255 );
  }
  void move() {
    // position <- velocity <- acceleration <-- Forces
    x += xSpd;
    y += ySpd;
  }
  void fall() {
    ySpd += 0.1;
  }
  void explode() {
    int strength = 8;
    xSpd = random(-strength, strength);
    ySpd = random(-strength, strength);
    lifeReduction = random(0.01, 0.03);
    isExploded = true;
  }
  void slowDown() {
    float amount = 0.96;
    if (isExploded) {
      xSpd *= amount; // xSpd = xSpd * 0.9;
      ySpd *= amount; // ySpd = ySpd * 0.9;
    }
  }
  void checkLifespan() {
    if (lifespan > 0.0) {
      lifespan -= lifeReduction; // lifespan = lifespan - lifeReduction;  
    } else {
      lifespan = 0.0;
      isDone = true;
    }
  }
  void checkOutOfCanvas() {
    if ( x < 0 || x > width ) {
      isDone = true;
    }
    if ( y < 0 || y > height ) {
      isDone = true;
    }
  }
  void display() {
    pushStyle();
    
    noStroke();
    fill( clr );
    ellipse(x, y, size * lifespan, size * lifespan);
    
    popStyle();
  }
}
