void setup() {
  size(400, 500);
}

void draw() {
  background(0);
  
  // conditional
  // if (expression) { block of code };
  // == (equal to)
  // >
  // <
  // >=
  // <=
  // && (and)
  // || (or)
  
  if (mouseX <= 100 || mouseX > 350) {
    background(255,0,0); // red
  }
  else if (mouseX > 200 && mouseX < 250) {
    background(255,255,0); // yellow
  }
  else if (mouseX >= 250 && mouseX < 300) {
    background(255,0,255); // pink
  }
  else {
    background(0, 0,255); // blue
  }
  
  int txt = mouseX;
  text( txt, mouseX, mouseY );
}
