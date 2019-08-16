import ddf.minim.*;

Minim mn;
AudioPlayer bgm;
AudioSample sound;
PImage img;

ArrayList<Button> buttons = new ArrayList<Button>();

int score = 0;


void setup() {
  size(500, 600);
  background(0);
  
  mn = new Minim(this);
  
  // NEVER LOAD IMAGE, VIDEO AND SOUND IN DRAW()!!!
  // ALWAYS LOAD THEM IN SETUP() AS GLOBAL VALUES AND USE THEM IN DRAW()
  
  sound = mn.loadSample("sound2.wav");
  bgm = mn.loadFile("groove.mp3");
  bgm.loop();
  img = loadImage("beam.png");
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
