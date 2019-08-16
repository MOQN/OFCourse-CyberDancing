void setup() {
  size(500, 600);
  background(0);
  
  //ellipseMode(CORNER); 
  //ellipse(width/2, height/2, 80, 80);
}

void draw() {
  background(0);
  
  // radians: 0, PI/2, PI,  TWO_PI = PI*2, ...
  // degrees: 0, 90,   180, 360, ...
  
  // radians(deg);   //deg to rad
  // degrees(rad);   //rad to deg
  
  float angle = radians( frameCount ); // deg to rad
  rotate( angle ); // it gets a RADIANS value!
  rectMode(CENTER);
  rect(width/2, height/2, 150, 120);
}
