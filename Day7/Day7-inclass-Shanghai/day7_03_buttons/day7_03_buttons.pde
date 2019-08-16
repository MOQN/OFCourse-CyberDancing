ArrayList<Button> buttons = new ArrayList<Button>();

void setup() {
  size(500, 600);
  background(0);
  int btnSize = 100;
  for (int y = btnSize/2; y < height; y += btnSize) {
    for (int x = btnSize/2; x < width; x += btnSize) {
      buttons.add( new Button(x, y, btnSize * 0.4) );
    }
  }
}

void draw() {
  background(0);

  for (int i=0; i<buttons.size(); i++) {
    Button btn = buttons.get(i); // buttons[i], if array
    btn.check(mouseX, mouseY);
    btn.display();
  }
}

















class Button {
  float x, y;
  float xSpd, ySpd;
  float rad;
  color c;
  Button(float _x, float _y, float r) {
    x = _x;
    y = _y;
    xSpd = 0;
    ySpd = 0;
    rad = r;
    c = color(255);
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
      } else {
        // hovering
        c = color(0, 255, 255); // cyan
      }
    } else {
      // out
      c = color(255);
    }
  }
}
