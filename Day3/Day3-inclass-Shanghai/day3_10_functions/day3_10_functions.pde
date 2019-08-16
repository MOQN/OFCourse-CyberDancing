// Declare a Variable:
// DataType variableName;

// Define a function:
// DataType functionName() {}
// DataType functionName(parameters) { a block of code }

// we have been re-defining "draw()" functions


// f(x) = x + 5
// f(3) = ??         // result = 8

// f(x) = x + 5    // define!
// f(3) = ??       // call and use the function
// result = 8      // it returns a value!

// f(input) = output
// input: parameter(s)
// output: returned value


// pre-defined functions - auto-formatted with darkBlue and bold
void setup() {
  // call the function
  //f(3);
  //fn(5, 10);
  
  int answer1 = addNumbers( 10, 5 );
  int answer2 = multiplyNumbers( 1, 2 );
  println(answer1 + answer2);
}
void draw() {
  //
}

///// user-defined functions /////

// f(x) = x + 5 //in Math
void f(int x) {
  int result = x + 5;
  println( result );
}
 
// fn(x, y) = x + y + 10 // in Math
void fn(int x, int y) {
  int result = x + y + 10;
  println( result );
}

// a + b
int addNumbers(int a, int b) {
  int result = a + b;
  //println( result ); // instead of showing the result in Console window
  return result;       // we can return the value you
  // so that we can use the returned value in next process!
}

// a * b
int multiplyNumbers(int a, int b) {
  return a * b;
}
 
 
 
 
