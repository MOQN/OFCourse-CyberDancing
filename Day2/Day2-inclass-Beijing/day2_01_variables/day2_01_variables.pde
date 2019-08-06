///// VARIABLES /////

// 1. declare (let the computer prepare a "memory" space)
// 2. initialize (assign) (store!)
// 3. call and use it! (bring the value back and use it!)

// DataType name;  // how to declare a variable

// int    whole numbers: 1, -1, -4322, 10000, 8888
// float  floating point numbers: 0.1231239, 3.1415..., -2.33415
// String text! Use double quotation marks!
// char   (Same as int! don't worry about it for now!)

int number = 3;
float pi = 3.1415;
String greeting = "Nihao!";

void setup() {
  size(500, 600);
  background(0); // black
  
  println( greeting );
  text( greeting, 10, 20); // ( txt, x, y );
}

void draw() {
  background(0); // black
  
  float size = 200;
  // environment variables - pink!
  ellipse( width/2, height/2, size, size );
  
}
