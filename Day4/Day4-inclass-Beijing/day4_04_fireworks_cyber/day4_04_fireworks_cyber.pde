//ArrayList<DataType> name = new ArrayList<DataType>();
ArrayList<Particle> fireworks = new ArrayList<Particle>();

void setup() {
  size(500, 600);
  background(0);
  
  // Add! Remove! -- These are possible because we are using ArrayList
  
  int totalNumber = 100;
  for (int i=0; i<totalNumber; i++) {
    fireworks.add( new Particle(width/2, height) );
  }
  
}

void draw() {
  //background(0);
  
  // How to draw background with transparency
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);
  
  // update & display
  for (int index = 0; index < fireworks.size(); index++) {
    Particle f = fireworks.get(index);
    f.move();
    f.fall();
    f.slowDown();
    //f.checkOutOfCanvas();
    f.checkLifespan();
    //f.display();
    
    // line?
    if (index != 0) {
      Particle prevf = fireworks.get(index-1);
      stroke(255, 100);
      line(f.x, f.y, prevf.x, prevf.y);
    }
    
    
    if (frameCount == 120) {
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
  //fireworks.add( new Particle(mouseX, mouseY) );
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
    size = random(10, 15);
    xSpd = 0;
    ySpd = -10;
    isDone = false;
    lifespan = 1.0; // 100%
    lifeReduction = 0; //random(0.003, 0.008);
    isExploded = false;
    clr = color( random(255),random(255),random(255) );
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
