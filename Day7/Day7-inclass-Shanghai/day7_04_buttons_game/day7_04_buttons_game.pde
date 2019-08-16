ArrayList<Button> buttons = new ArrayList<Button>();

int score = 0;

void setup() {
  size(500, 600);
  background(0);
}


void draw() {
  background(0);
  
  // show the mouse trace?
  if (mousePressed) {
    pushStyle();
    stroke(255, 0, 0);
    strokeWeight(5);
    line(pmouseX, pmouseY, mouseX, mouseY);
    popStyle();
  }
  
  // GENERATE
  if (random(1) < 0.02) {
    buttons.add( new Button(width/2, height, random(5, 15)) );
  }

  // UPDATE & DISPLAY
  for (int i=0; i<buttons.size(); i++) {
    Button btn = buttons.get(i); // buttons[i], if array
    btn.move();
    btn.fall();
    btn.check(mouseX, mouseY);
    btn.checkOutOfCanvas();
    btn.display();
  }

  // REMOVE if it's done
  for (int i = buttons.size()-1; i >= 0; i--) {
    Button btn = buttons.get(i);
    if (btn.isDone) {
      buttons.remove(i); // i = index
    }
  }
  
  // show the score
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text( score, width/2, height/2 );
  
  // see the number of particles(buttons)
  fill(255);
  textSize(10);
  text( buttons.size(), 20, 20);
}
