float x, y;
float r, g, b;
float size = 30; // declare and initialize at the same time!

boolean state = false; // true or false

void setup() {
  size(500, 600);
  background(255);
  x = width/2;
  y = height/2;
  r = 0;
  g = 0;
  b = 0;
}

void draw() {
  //background(255);
  // void mousePressed() { } // WRONG!
  
  noStroke();
  fill(r, g, b);
  ellipse(50, 50, size, size);
}

void keyPressed() {
  println( key );
  // char = ' ';  single quotation mark

  // if ( expression ) { code }
  // if ( conditions ) { do something!!! }
  
  // == equal to
  // >= greater than and equal to
  // <= less than and equal to
  // >  greater than
  // <  less than
  
  // && AND e.g. (condition && condition) 
  // || OR  e.g. (condition || condition)
  
  if (key == ' ') {
    background(255);
  } else if (key == 'r' || key == 'R') {
    r = 255;
    g = 0;
    b = 0;
  } else if (key == 'g' || key == 'G') {
    r = 0;
    g = 255;
    b = 0;
  } else if (key == 'b' || key == 'B') {
    r = 0;
    g = 0;
    b = 255;
  } else {
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  // change the size with arrow keys
  if (keyCode == UP) {
    size = size + 1;
  } else if (keyCode == DOWN) {
    size = size - 1;
  }
}

void mouseDragged() {
  noStroke();
  fill(r, g, b);
  ellipse( mouseX, mouseY, size, size );
}

//void mousePressed() {
//  r = random(255);
//  g = random(255);
//  b = random(255);
//}
