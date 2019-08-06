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
    f.move();
    f.display();
  }
  
  // limit the number of particles
  while ( fireworks.size() > 1000 ){
    int index = 0;
    fireworks.remove(index);
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

  Particle(float _x, float _y) {
    x = _x;
    y = _y;
    size = random(5, 10);
    xSpd = 0;
    ySpd = -1;
  }
  void move() {
    // position <- velocity <- acceleration <-- Forces
    x += xSpd;
    y += ySpd;
  }
  void display() {
    pushStyle();
    
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
    
    popStyle();
  }
}
