import ddf.minim.*;

Minim mn;

AudioPlayer song;     // to play
AudioSample sound;   // to trigger

ArrayList<Button> buttons = new ArrayList<Button>();

int score = 0;

void setup() {
  size(500, 600);
  background(0);
  
  mn = new Minim(this);
  song = mn.loadFile("groove.mp3");
  sound = mn.loadSample("sound1.wav");
  
  song.loop();
}

void draw() {
  background(0);
  
  // generate
  if (random(1) < 0.02) {
    buttons.add( new Button(width/2, height) );
  }
  
  if (mousePressed) {
    strokeWeight(5);
    stroke(255, 0, 0);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  
  // update & display
  for (int i=0; i<buttons.size(); i++) { //buttons.length, if Array
    Button b = buttons.get(i);  // buttons[i], if Array
    b.move();
    b.fall();
    b.check(mouseX, mouseY);
    b.display();
    b.checkOutOfCanvas();
  }
  
  // remove if it's done!
  for (int i = buttons.size()-1; i >= 0; i--) {
    Button b = buttons.get(i);
    if (b.isDone) {
      buttons.remove(i);
    }
  }
  
  // show the score
  pushStyle();
  textSize(40);
  textAlign(CENTER);
  text( score, width/2, height/2 );
  popStyle();
  
  // show the number of objects
  //text( buttons.size(), 10, 20 );
}

class Button {
  float x, y;
  float xSpd, ySpd;
  float rad;
  color c;
  float r, g, b;
  boolean isDone;
  Button(float _x, float _y) {
    x = _x;
    y = _y;
    xSpd = random(-1, 1);
    ySpd = random(-10, -9);
    rad = random(20, 40);
    r = random(255);
    g = random(255);
    b = random(255);  // original color and we don't change the r,g,b
    c = color(r,g,b); // current color can be changed based on interaction
    isDone = false;
  }
  void display() {
    pushStyle();
    
    noStroke();
    fill(c);
    ellipse(x, y, rad*2, rad*2);
    
    popStyle();
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
  void fall() {
    ySpd += 0.1;
  }
  void check(float _x, float _y) {
    float distance = dist(x, y, _x, _y);
    if (distance < rad) {
      // in the area!
      c = color(255, 255, 0); // yellow
      if (mousePressed) {
        c = color(255, 0, 0); // red
        //background(255, 0, 0); // red background!!
        rad *= 2; // change the radius for some popping-up effect!
        score++;
        sound.trigger();
        isDone = true;
      }
    } else {
      // out of the area...
      c = color(r,g,b); // white
    }
  }
  void checkOutOfCanvas() {
    if (y > height) {
      isDone = true;
    }
  }
}
