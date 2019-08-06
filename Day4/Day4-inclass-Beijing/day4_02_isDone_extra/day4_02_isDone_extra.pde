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
    // display
    f.display();
    if (f.isDone) {
      fireworks.remove(index);
      index--;
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

  Particle(float _x, float _y) {
    x = _x;
    y = _y;
    size = random(5, 10);
    xSpd = 2;
    ySpd = 2;
    isDone = false;
  }
  void move() {
    // position <- velocity <- acceleration <-- Forces
    x += xSpd;
    y += ySpd;
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
    fill(255);
    ellipse(x, y, size, size);
    
    popStyle();
  }
}
