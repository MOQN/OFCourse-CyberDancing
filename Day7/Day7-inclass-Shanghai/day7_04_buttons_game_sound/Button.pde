class Button {
  float x, y;
  float xSpd, ySpd;
  float rad;
  color c;
  boolean isDone;
  
  Button(float _x, float _y, float r) {
    x = _x;
    y = _y;
    xSpd = random(-1, 1);
    ySpd = random(-10, -8);
    rad = r;
    c = color(255);
    isDone = false;
  }
  void display() {
    pushStyle();

    noStroke();
    fill(c);
    ellipse(x, y, rad*2, rad*2);

    popStyle();
  }
  void check(float _x, float _y) {
    float distance = dist(x, y, _x, _y);
    if (distance < rad) {
      // in
      if (mousePressed) {
        // pressed
        c = color(255, 0, 255); // pink
        isDone = true;
        rad *= 5; // make the size large suddenly!
        sound.trigger(); // make noise!
        //background(255, 0, 0); // red bg??
        score++; 
      } else {
        // hovering
        c = color(0, 255, 255); // cyan
      }
    } else {
      // out
      c = color(255);
    }
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
  void fall() {
    ySpd += 0.1;
  }
  void checkOutOfCanvas() {
    if (y > height) {
      isDone = true;
    }
  }
}
