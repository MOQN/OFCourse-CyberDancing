// Array vs. ArrayList
// ArrayList = Dynamic Array!
// "It allows elements to be added or removed"

// https://processing.org/reference/ArrayList.html

// ArrayList<DataType> arrayName = new ArrayList<DataType>();


ArrayList<Particle> particles = new ArrayList<Particle>();


void setup() {
  size(500, 600);
  background(100);
}

void draw() {
  background(100);
  
  // GENERATE
  //particles.add( new Particle(width/2, height/2) );
  
  // UDDATE & DISPLAY 
  for (int i=0; i<particles.size(); i++) {
    Particle p = particles.get(i);
    // get only one element and store it in a temporary variable "p"!
    // p = one element, paticles = array 
    p.move();
    p.display();
  }
  
  // LIMIT
  // try to use "while" instead of "if"
  if (particles.size() > 1000) {
    int index = 0; // the first = the oldest!
    particles.remove(index); // remove one element with the index number
  }
  
  // show the total number of particles!
  fill(0, 0, 255);
  noStroke();
  text( particles.size(), 10, 20 );
}

void mouseDragged() {
  particles.add( new Particle(mouseX, mouseY) );
}



class Particle {
  float x, y;
  float xSpd, ySpd;
  float dia;
  Particle(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    xSpd = random(-1, 1);
    ySpd = random(-1, 1);
    dia = random(10, 50);
  }
  void display() {
    pushStyle();

    fill(255);
    noStroke();
    ellipse(x, y, dia, dia);

    popStyle();
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
}
