float x, y;
float size;
float r, g, b;

void setup() {
  size(500, 600);
  background(255);

  x = width/2;
  y = height/2;
  size = random(10, 30);
  r = random(255);
  g = random(255);
  b = random(255);
}

void draw() {
  //background(255);
}

// setup, draw, mouseInteractions, keyInteractions,
void mouseDragged() {
  //fill(r, g, b);
  //noStroke();
  //ellipse( mouseX, mouseY, size, size );

  stroke(r, g, b);
  strokeWeight(size);
  line( pmouseX, pmouseY, mouseX, mouseY);

  // spread random circles
  strokeWeight(1);
  ellipse( random(width), random(height), 1, 1 );
  ellipse( random(width), random(height), 2, 2 );
}

void mousePressed() {
  //size = random(10, 30);
  //r = random(255);
  //g = random(255);
  //b = random(255);
}

void keyPressed() {
  println(key);
  
  // ' '  is dataType "char"
  if (key == ' ') { // space bar
    // clear the bg with white color
    background(255);
  }
  else if (key == 'r' || key == 'R') {
    r = 255;
    g = 0;
    b = 0;
  }
  else if (key == 'g' || key == 'G') {
    r = 0;
    g = 255;
    b = 0;
  }
  else if (key == 'b' || key == 'B') {
    r = 0;
    g = 0;
    b = 255;
  }
  else {
    // make the color random
    //size = random(10, 30);
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  // uses of keyCode
  // https://processing.org/reference/keyCode.html
  if (keyCode == UP) {
    size = size + 2;
  } else if (keyCode == DOWN) {
    size = size - 2;
  }
  
  // limit the minimal size value
  if (size < 2) {
    size = 2;
  }
  
  
}
