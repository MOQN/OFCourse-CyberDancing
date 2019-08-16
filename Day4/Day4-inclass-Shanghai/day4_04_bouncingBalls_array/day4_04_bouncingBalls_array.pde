int totalNum = 1500;
float[] x = new float[totalNum];
float[] y = new float[totalNum];
float[] xSpd = new float[totalNum];
float[] ySpd = new float[totalNum];
int[] size = new int[totalNum];
float[] r = new float[totalNum];
float[] g = new float[totalNum];
float[] b = new float[totalNum];

void setup() {
  size(500, 600);
  background(100);

  // assigning values into the arrays
  for (int i=0; i<totalNum; i++) { // increment or index
    x[i] = width/2;
    y[i] = height/2;
    size[i] = int( random(5, 15) ); // float to int!
    xSpd[i] = random(-5, 5);
    ySpd[i] = random(-5, 5);
    r[i] = random(255);
    g[i] = random(255);
    b[i] = random(255);
  }
}

void draw() {
  background(100);

  for (int i=0; i<totalNum; i++) {
    // update
    x[i] += xSpd[i]; // x = x + xSpd;
    y[i] += ySpd[i]; // y = y + ySpd;
    // check
    if (x[i] < 0 || x[i] > width) {
      xSpd[i] = -xSpd[i];
      r[i] = random(255);
      g[i] = random(255);
      b[i] = random(255);
    }
    if (y[i] < 0 || y[i] > height) {
      ySpd[i] = -ySpd[i];
      r[i] = random(255);
      g[i] = random(255);
      b[i] = random(255);
    }
    // display
    fill(r[i], g[i], b[i]);
    noStroke();
    ellipse(x[i], y[i], size[i], size[i]);
  }
}
