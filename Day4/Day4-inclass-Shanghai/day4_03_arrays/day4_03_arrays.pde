int[] numbers = {100, 150, 200, 300};
float[] nums = {3.6, -1.2, PI};
String[] greetings = {"Nihao", "Hello", "Ciao", "Hi", "Hola"};

//numbers[2] = 1000;
//println( numbers );
//println( numbers[2] );

//println( greetings[ 0 ] ); // the first
//println( greetings[ greetings.length-1 ] ); // the last

// [] Array Access Operator
// array[index]  // with index number you can access one element(value) in the array

// the first index number is 0 !!
// the last index number is "total number of the elements - 1" !!

// array.length  // returns the total number of the array elements
// the last index number is "array.length - 1" !!



// arrays <3 forLoop!

// you can access(iterate) every element in the array!!
for (int i=0; i<greetings.length; i++) {
  println(i);
  println( greetings[ i ] );
}
