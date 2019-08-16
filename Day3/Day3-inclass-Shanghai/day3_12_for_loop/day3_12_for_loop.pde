void setup() {
  size( 500, 600 );
  background(0); // black
  
  // if statement
  println("ifStatement");
  int x = 0;
  if (x < 10) {
    println(x);
  }
  
  
  // while loop - let's not use it for now ... :D
  println("while loop");
  int w = 0;
  while (w < 10) {
    println(w);
    w = w + 1;
  }
  
  // int i = 0;
  // i < 10;
  // i = i + 1;
  
  // for loop
  println("for loop");
  for (int i=0; i<10; i=i+1) {
    println(i);
  }
  // for (from; until; increment) {
    // let's repeat this!
  //}
}

void draw() {
  background(255, 0, 0); // red
}
    
