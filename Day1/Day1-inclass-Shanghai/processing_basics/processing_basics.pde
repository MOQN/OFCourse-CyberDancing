// https://www.processing.org/reference/

void setup() {
  // once!
  size( 600, 500 ); // w, h
  background(100);
}

void draw() {
  // loop!
  //background(100, 100); // X! (while p5.js O!)
  fill(100, 10);
  noStroke();
  // noFill();
  rect(0, 0, width, height); // rect
  
  
  fill(255); // white
  //stroke(255, 0, 0); // red
  noStroke();
  ellipse( mouseX, mouseY, 100, 100 ); // (x,y, w, h);
}

// PINK
// Environment Variables!!! provided by Processing

// COLOR
// (w)
// (w, a) alpha = opacity, transparency
// (r, g, b) 
// (r, g, b, a)
// range: 0 - 255 = 8 switches! 11111111


// Raster vs. Vector
// https://vector-conversions.com/vectorizing/raster_vs_vector.html
