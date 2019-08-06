float x, y;
float xSpeed, ySpeed;
float dia, diaChange;
float r, g, b;

void setup() {
  size(400, 500);
  background(0);

  x = width/2;
  y = height/2;
  dia = 50;
  xSpeed = random(-5, 5);
  ySpeed = random(-5, 5);
  diaChange = 1;
  r = random(255);
  g = random(255);
  b = random(255);
}

void draw() {
  background(0);
  // update
  // check & compare
  // display

  // update values
  x = x + xSpeed;
  y = y + ySpeed;
  dia = dia + diaChange;

  // check
  if (x < 0 || x > width) {
    xSpeed = -xSpeed;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  if (y < 0 || y > height) {
    ySpeed = -ySpeed;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  if (dia > 60 || dia < 20) {
    diaChange = -diaChange;
  }

  // display
  fill(r, g, b);
  ellipse(x, y, dia, dia);
}
