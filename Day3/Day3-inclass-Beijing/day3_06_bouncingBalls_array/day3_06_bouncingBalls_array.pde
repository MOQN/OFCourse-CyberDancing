int totalNumber = 100;
float[] x = new float[totalNumber];
float[] y = new float[totalNumber];
float[] xSpd = new float[totalNumber];
float[] ySpd = new float[totalNumber];
float[] size = new float[totalNumber];
float[] r = new float[totalNumber];
float[] g = new float[totalNumber];
float[] b = new float[totalNumber];

void setup() {
  size(500, 600);
  background(0);

  // assign values!
  for (int i = 0; i < x.length; i++) {
    x[i] = width/2;
    y[i] = height/2;
    xSpd[i] = random(-5, 5);
    ySpd[i] = random(-5, 5);
    size[i] = random(30, 80);
    r[i] = random(255);
    g[i] = random(255);
    b[i] = random(255);
  }
}

void draw() {
  background(0);
  
  // let's use the values in the arrays!
  
  for (int i=0; i< totalNumber; i++) {
    // update
    x[i] += xSpd[i];
    y[i] += ySpd[i];
    // check!
    if (x[i] < 0 || x[i] > width) {
      xSpd[i] = -xSpd[i];
    }
    if (y[i] < 0 || y[i] > height) {
      ySpd[i] = -ySpd[i];
    }
    // display
    noStroke();
    fill(r[i], g[i], b[i]);
    ellipse( x[i], y[i], size[i], size[i] );
  }
}
