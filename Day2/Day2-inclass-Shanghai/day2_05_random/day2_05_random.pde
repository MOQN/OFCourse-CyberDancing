// grobal variables
float x, y;
float size;
float r, g, b;

// FUNCTION
// DataType functionName() { code }  <-- scope!


void setup() {
  size(500, 600);
  background(255);

  x = width/2;
  y = height/2;
  size = random(10, 300);
  
  // local variables
  // float r = random(255); // 0 - 254.9999
  // float g = random(255); // 0 - 254.9999
  // float b = random(255); // 0 - 254.9999
  
  r = random(255);
  g = random(255);
  b = random(255);

  // RANDOM()
  // random( "put a range here!" );

  // random( value );     // 0 to the value(exclusive)
  // random( 255 );       // 0 - 255(254.9999) // 255 is exclusive! 
  // random( 10 );        // 0 - 10(9.9999)

  // random( min, max );  // ***
  // random( -5, 5 );     // -5 to 4.9999
  // random( 10, 100 );   // 10 to 99.9999
  // random( -15, -3 );   // -15 to -3(?)
  // random( 100, 10 );   // Wrong way of using the function!! you only get 100!
}

void draw() {
  //background(255);
  
  fill(r, g, b);
  noStroke();
  ellipse( x, y, size, size );
}

void mousePressed() {
  size = random(10, 300);
  r = random(255);
  g = random(255);
  b = random(255);
}
