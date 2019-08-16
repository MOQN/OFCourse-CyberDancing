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
  
  float distance = dist(pmouseX, pmouseY, mouseX, mouseY); //(x1, y1, x2, y2)
  float thickness = map(distance, 1, 10, 10, 1); // flip the value!
  thickness = constrain(thickness, 1, 100); // only we get from 1 to 100!
  
  stroke(r, g, b);
  strokeWeight(thickness);
  line( pmouseX, pmouseY, mouseX, mouseY );
  // learn about strokeJoin() and strokeCap()

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
    r = random(255);
    g = random(255);
    b = random(255);
  }
}
