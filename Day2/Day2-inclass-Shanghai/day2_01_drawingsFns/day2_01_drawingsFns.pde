void setup() {
  size(500, 600);
  background(255, 0, 0);

  // COLOR
  // (w)           // 255-white 0-Black
  // (w, a)        // alpha: opacity 
  // (r, g, b)     // Red Green Blue
  // (r, g, b, a)  // + Alpha!
  // (255, 255, 255, 255);
  // search for "colorMode( )"

  stroke(0, 255, 0); // green
  strokeWeight(5);
  line(0, 0, 500, 600);  // (x1, y1, x2, y2)
  point(300, 100); //(x,y)
  
  fill(255, 0, 255); // pink
  noStroke();
  rect(100, 100, 150, 250); // (x,y,w,h)
  
  fill(255, 255, 0, 150); // yellow
  ellipse( 500/2, 600/2, 200, 200 );
  
  // don't worry about other display functions! (for now :D)
}

void draw() {
}
