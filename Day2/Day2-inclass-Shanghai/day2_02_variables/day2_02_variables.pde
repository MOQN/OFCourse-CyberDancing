// DataType nameVariable;  // declare = let com prepare a memory space!
// nameVariable = value;   // assign = store the value into the memory space!
                           // "=" is "assign operator", not "equal to" ! 

// 1. declare
// 2. assign (initialize - if you assign a value for the first time!)
// 3. call and use it!

// 1. declare
int x;
int y;

void setup() {
  size(500, 600);
  background(0);
  
  // if auto-Formatted with Pink color!
  // Environment Variables, such as mouseX, mouseY, frameCount
  
  // ellipse( width/2, height/2, 200, 200 ); // (x,y,w,h)
  
  // to see the value in Console window
  println(width);
  println(height); 
  
  // 2. assign
  x = width/2;
  y = height/2;
}

void draw() {
  background(0); // to clear the background with the color (black)
  
  noStroke();
  // 3. call and use
  ellipse( x, y, 200, 200 );
}
