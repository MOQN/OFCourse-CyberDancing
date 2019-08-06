void setup() {
  size( 500, 600 );
  background(0);
  
  // triangle(x1, y1, x2, y2, x3, y3);
  float x = width/2;
  float y = height/2;
  triangle(x, y, x-20, y-10, x-20, y+10);
  
  // arc - try to draw guidelines!
  // arc(x, y, w, h, fromAngle1, untilAngle2);
  noFill();
  stroke(255,0,0);
  ellipse( width/2, height/2, 300, 300 );  
  
  strokeWeight(4);
  stroke(255);
  //arc( width/2, height/2, 300, 300, -PI*0.2, PI*0.2);
  arc( width/2, height/2, 300, 300, radians(180), radians(270));
  // radians! instead of degrees
  // radians: PI, TWO_PI, PI/2, ..
  // degrees: 90, 360, 180
  
  // ***
  // degrees( a radian value ); // rad to deg!
  // radians( a degree value ); // deg to rad!
}

void draw() {
  //
}
