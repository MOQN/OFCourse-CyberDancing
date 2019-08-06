// REUSABILITY & MODULARITY

void setup() {
  size(500, 600);
  background(0);

  text( f(5) , 10, 20);
  
  float sum = addTwoValues(10, 5.5);
  println(sum);
}


void draw() {
  //
}

//DataType functionName(parameters) { a block of code }
int f(int x) {
  int result = x + 3;
  return result;
}

float addTwoValues(float a, float b) {
  float result = a + b; 
  return result;
}
