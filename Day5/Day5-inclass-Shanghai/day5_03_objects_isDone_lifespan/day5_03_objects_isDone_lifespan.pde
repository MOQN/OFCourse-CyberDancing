ArrayList<Particle> particles = new ArrayList<Particle>();


void setup() {
  size(500, 600);
  background(100);
}

void draw() {
  background(100);

  // GENERATE
  particles.add( new Particle(width/2, height/2) );

  // UPDATE & DISPLAY 
  for (int i=0; i<particles.size(); i++) {
    Particle p = particles.get(i); 
    p.move();
    p.updateLifespan();
    //p.checkOutOfCanvas();
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
  text( particles.size(), 10, 20 );
}

void mouseDragged() {
  particles.add( new Particle(mouseX, mouseY) );
}



class Particle {
  float x, y;
  float xSpd, ySpd;
  float dia;
  boolean isDone; // true or false
  float lifespan = 1.0; // 100%
  float lifeReduction = random(0.001, 0.010); // 0.1% to 1%
  
  Particle(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    xSpd = random(-1, 1);
    ySpd = random(-1, 1);
    dia = random(10, 20);
    isDone = false;
  }
  void display() {
    pushStyle();

    fill(255, 255 * lifespan);
    noStroke();
    ellipse(x, y, dia * lifespan, dia * lifespan);
    
    //fill(255, 0, 0);
    //text( lifespan, x, y );
    
    popStyle();
  }
  void move() {
    x += xSpd;
    y += ySpd;
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
      lifespan -= lifeReduction; // lifespan = lifespan - lifeReduction  
    } else {
      isDone = true;
      lifespan = 0;
    }
  }
}
