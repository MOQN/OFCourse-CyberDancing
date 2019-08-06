float prevX = 0;
float prevY = 0;

void setup() {
  size(400, 500);
  background(255);
}

void draw() {
  
  if (mousePressed) {
    
    // float output = map(input, inputMin, inputMax, outputMin, outputMax);
    float red = map(mouseX, 0, width, 255, 0);
    float green = map(mouseY, 0, height, 0, 255);
    float blue = map(mouseX, 0, width, 0, 255);
    //stroke(red, green, blue);
    stroke(0);
    
    float distance = dist(prevX, prevY, mouseX, mouseY);
    float thickness = map(distance, 0, 100, 15, 0);
    //constrain(input, min, max);
    thickness = constrain(thickness, 1, 100); 
    
    strokeWeight(thickness);
    line(prevX, prevY, mouseX, mouseY);
    
    //if (distance > 50) {
    //  for (int i=0; i<50; i++) {
    //    noStroke();
    //    fill(0);
    //    ellipse(random(width), random(height), 3, 3);
    //  }
    //}
  }
  
  
  // do many many things you want to do!
  
  
  // at the very very end
  prevX = mouseX;
  prevY = mouseY;
}

void keyPressed() {
  if (key == ' ') {
    background(255);
  }
}
