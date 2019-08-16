import processing.video.*;

ArrayList<Button> buttons = new ArrayList<Button>();
int score = 0;

Capture cam;

void setup() {
  size(800, 600);
  background(0);

  cam = new Capture(this, 640, 480);
  cam.start();
}

void draw() {
  if (cam.available()) {
    cam.read();
    cam.filter(THRESHOLD, 0.3);
    cam.filter(INVERT);
    cam.loadPixels();
  }

  background(0);
  image(cam, 0, 0, width, height);

  // generate
  if (random(1) < 0.02) {
    buttons.add( new Button(width/2, 0) );
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
    //b.checkPixel(cam.copy()); // or
    b.checkPixel();
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
    ySpd = 0; //random(-10, -9);
    rad = random(20, 40);
    r = random(255);
    g = random(255);
    b = random(255);  // original color and we don't change the r,g,b
    c = color(r, g, b); // current color can be changed based on interaction
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
        isDone = true;
      }
    } else {
      // out of the area...
      c = color(r, g, b); // white
    }
  }
  void checkPixel(PImage img) {
    int mapX = int(map(x, 0, width, 0, img.width));
    int mapY = int(map(y, 0, height, 0, img.height));
    color c = img.get( mapX, mapY );
    if ( c == color(255) ) {
      rad *= 2;
      score++;
      isDone = true;
    }
  }
  void checkPixel() {
    int mapX = int(map(x, 0, width, 0, cam.width));
    int mapY = int(map(y, 0, height, 0, cam.height));
    int index = mapX + mapY*cam.width;
    if (index < 0 || index >= cam.pixels.length) return;
    color c = cam.pixels[index];
    if ( c == color(255) ) {
      rad *= 2;
      score++;
      isDone = true;
    }
  }  
  void checkOutOfCanvas() {
    if (y > height) {
      isDone = true;
    }
  }
}
