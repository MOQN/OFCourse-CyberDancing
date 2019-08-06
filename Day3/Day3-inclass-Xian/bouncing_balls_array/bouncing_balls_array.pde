
int numOfBalls = 100;
float x[] = new float[numOfBalls]; 
float y[] = new float[numOfBalls];
float size[] = new float[numOfBalls];
float xSpd[] = new float[numOfBalls];
float ySpd[] = new float[numOfBalls];
float r[] = new float[numOfBalls];
float g[] = new float[numOfBalls];
float b[] = new float[numOfBalls];
// let the computer know we are going to add 10 elements!
// the computer will prepare 10 "empty" memory spaces. 

void setup() {
  size(400, 500);
  background(0);

  for (int i=0; i<numOfBalls; i++) {
    x[i] = width/2;
    y[i] = height/2;
    size[i] = 30;
    xSpd[i] = random(-5, 5);
    ySpd[i] = random(-5, 5);
    r[i] = random(255);
    g[i] = random(255);
    b[i] = random(255);
  }
}

void draw() {
  background(0);

  for (int i=0; i<numOfBalls; i++) {
    x[i] += xSpd[i];  // x = x + 5;
    y[i] += ySpd[i]; // y = y - 1;
    if (x[i] < 0 || x[i] > width) {
      xSpd[i] *= -1;
    }
    if (y[i] < 0 || y[i] > height) {
      ySpd[i] *= -1; //ySpd = ySpd * -1;
    }
    stroke(r[i], g[i], b[i]);
    fill(r[i], g[i], b[i], 100);
    ellipse(x[i], y[i], size[i], size[i]);
  }
}
