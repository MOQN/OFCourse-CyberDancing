//ArrayList<DataType> name = new ArrayList<DataType>();
ArrayList<Particle> fireworks = new ArrayList<Particle>();

void setup() {
  size(500, 600);
  background(0);
}

void draw() {
  background(0);
  
  // update & display
  for (int index = 0; index < fireworks.size(); index++) {
    Particle f = fireworks.get(index);
    // update
    f.move();
    // check 
    f.checkOutOfCanvas();
    f.checkLifespan();
    // display
    f.display();
  }
  
  // if the particle is done, remove from the arrayList
  for (int i = fireworks.size()-1; i >= 0; i--) {
    Particle f = fireworks.get(i);
    if (f.isDone) {
      fireworks.remove(i);
    }
  }
  
  
  text( fireworks.size(), 10, 20 );
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

  Particle(float _x, float _y) {
    x = _x;
    y = _y;
    size = random(15, 30);
    xSpd = random(-0.1, 0.1);
    ySpd = random(-0.1, 0.1);
    isDone = false;
    lifespan = 1.0; // 100%
    lifeReduction = random(0.003, 0.008);
  }
  void move() {
    // position <- velocity <- acceleration <-- Forces
    x += xSpd;
    y += ySpd;
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
    fill(255, 255 * lifespan);
    ellipse(x, y, size * lifespan, size * lifespan);
    
    popStyle();
  }
}
