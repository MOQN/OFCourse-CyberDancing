ArrayList<Particle> particles = new ArrayList<Particle>();


void setup() {
  size(500, 600);
  background(0);
  
  //int totalNumber = 30;
  //for (int i=0; i<totalNumber; i++) {
  //  particles.add(  new Particle(width/2, height/2)  );
  //}
}


void draw() {
  background(0);
  
  // generate!!!
  particles.add(  new Particle(mouseX, mouseY)  );
  
  // update & display particles
  for (int i=0; i<particles.size(); i++) {
    Particle p = particles.get(i);
    p.move();
    p.getBigger();
    p.display();
  }
  
  // remove
  
  while (particles.size() > 500) {
    particles.remove(0);
  }
}
