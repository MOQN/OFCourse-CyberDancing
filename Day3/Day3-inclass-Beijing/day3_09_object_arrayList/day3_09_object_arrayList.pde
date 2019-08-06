//https://processing.org/reference/ArrayList.html

// Array
// DataType[] name = new DataType[TotalNum];
// ArrayList
// ArrayList<DataType> name = new ArrayList<DataType>();
ArrayList<Particle> particles = new ArrayList<Particle>();


void setup() {
  size(500, 600);
  background(0);
  
  // ARRAY
  // for (int i=0; i<particles.length; i++) {
  //   particles[i] = new Particle(width/2, height/2);
  // }
  
  // ARRAYLIST
  int totalNumber = 30;
  for (int i=0; i<totalNumber; i++) {
    //particles[i] = new Particle(width/2, height/2);
    particles.add(  new Particle(width/2, height/2)  );
  }
}


void draw() {
  background(0);
  
  // ARRAY 
  // for (int i=0; i<particles.length; i++) {
  //   Particle p = particles[i];
  //   p.move();
  //  p.display();
  // }
  
  // ARRAYLIST
  for (int i=0; i<particles.size(); i++) {
    Particle p = particles.get(i);
    p.move();
    p.display();
  }
  
}








class Particle {
  float x, y;
  float xSpd, ySpd;
  float size;
  Particle(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    xSpd = random(-1, 1);
    ySpd = random(-1, 1);
    size = random(10, 20);
  }
  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
}
