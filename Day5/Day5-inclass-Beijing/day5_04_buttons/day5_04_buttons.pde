ArrayList<Button> buttons = new ArrayList<Button>();


void setup() {
  size(500, 600);
  background(0);
  
  buttons.add( new Button(width/2, height/2) );
}

void draw() {
  background(0);
  
  for (int i=0; i<buttons.size(); i++) { //buttons.length, if Array
    Button b = buttons.get(i);  // buttons[i], if Array
    b.check(mouseX, mouseY);
    b.display();
  }
}

class Button {
  float x, y;
  float xSpd, ySpd;
  float rad;
  color c;
  Button(float _x, float _y) {
    x = _x;
    y = _y;
    rad = 100;
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
      // in the area!
      c = color(255, 255, 0); // yellow
      if (mousePressed) {
        c = color(255, 0, 0); // red
      }
    } else {
      // out of the area...
      c = color(255); // white
    }
  }
}
