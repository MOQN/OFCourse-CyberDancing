// 1. declare
float x, y;
float size;
float r, g, b;

void setup() {
  size(500, 600);
  background(100);
  //println( frameCount ); // value: 0
  
  // frameRate
  // FPS: 60 ( frame(image) per second ) // computer graphics
  // FPS: 30 // movies
  // frameRate(1);
  
  // 2. initialize values in setup();
  x = width/2;
  y = height/2;
  size = 100;
  r = 255;
  g = 0;
  b = 0;
} 

void draw() {
  background(100);
  
  // 3. update and use them!
  x = x - 0.3;
  y = y + 0.1;
  
  fill(r, g, b);
  ellipse( x, y, size, size );
  
  // println( frameCount ); // value: 1 to infinite
  // text( frameRate, 10, 20 );
}

// event! interaction!
void mousePressed() {
  r = random(255);
  g = random(255);
  b = random(255);
}
