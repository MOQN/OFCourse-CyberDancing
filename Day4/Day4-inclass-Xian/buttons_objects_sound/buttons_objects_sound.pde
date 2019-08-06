import ddf.minim.*;

ArrayList<Button> buttons = new ArrayList<Button>();
int score = 0;

Minim mn;
AudioSample sound1;

void setup() {
  size(400, 500);  
  background(0);
  
  mn = new Minim(this);
  sound1 = mn.loadSample("sound.wav");
  
  // add one "Button" object into the array "buttons"
  // buttons.add( new Button(width/2, height/2) );


  ///// grid of buttons /////
  /*
  for (int y = 50; y<height; y+=100) {
    for (int x = 50; x<width; x+=100) {
      buttons.add( new Button(x, y) );
    }
  }
  */
}

void draw() {
  background(0);
  
  // generate buttons!
  if (random(1) < 0.05) {
    buttons.add( new Button(random(width), 0) );
  }
  
  // update & display the buttons
  for (int i=0; i<buttons.size(); i++) {
    Button b = buttons.get(i); // Get one element("button") in the "buttons" array
    b.move();
    b.check(mouseX, mouseY);
    b.display();
  }
  
  // remove buttons if it's dead or clicked!
  for (int i=buttons.size()-1; i>=0; i--) {
    Button b = buttons.get(i);
    if (b.isClicked == true) {
      buttons.remove(i); // remove it from the array with index "i"
    }
  }
  
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text( score, width/2, height/2 );
}

class Button {
  float x, y;
  float xSpd, ySpd;
  float rad;
  float r, g, b;
  boolean isClicked;
  Button(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    xSpd = 0;
    ySpd = random(1,4);
    rad = random(10, 20);
    r = 255;
    g = 255;
    b = 255;
    isClicked = false;
  }
  void display() {
    pushStyle();
    fill(r, g, b);
    ellipse(x, y, rad*2, rad*2);
    //image(apple!);
    popStyle();
  }
  void move() {
    x += xSpd;
    y += ySpd;
  }
  void check(float tempX, float tempY) {
    float distance = dist(x, y, tempX, tempY);
    if (distance < rad) {
      // in this button area
      r = 255;
      g = 255;
      b = 0;
      if (mousePressed == true) {
        // mouse is clicked!
        r = 255;
        g = 0;
        b = 0;
        rad = rad * 2;
        // global score value!
        score++; //score = score + 1;
        
        isClicked = true;
        
        sound1.trigger();
      }
    } else {
      // out of this button area
      r = 255;
      g = 255;
      b = 255;
    }
  }
}
