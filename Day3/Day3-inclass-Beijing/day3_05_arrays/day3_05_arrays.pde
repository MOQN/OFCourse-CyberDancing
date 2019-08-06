int[] numbers = {3, 5, -1, 4, 10, 12, 50};
String[] greetings = {"Hello!", "Nihao!", "Ciao"};

// the first index is 0;

// the last index is "total number of the values(elements) - 1"
// "array.length" returns the total number of the elements

// you can access the value(element) with [] and index number
// [] is called "array access operator".

//println( numbers[0] ); 
//println( numbers[ numbers.length-1 ] );


// we can get one value from the array
// println( numbers[4] );
// but also you can change the value!
// numbers[4] = 1000;


//println( greetings[1] );


/////  arrays <3 for-loops  /////

// "i" implies "increment" and "index"
// this is the way to access every element in an array
//for (int i=0; i<numbers.length; i++) {
//  println( i + ": " + numbers[i] );
//}





// for Array, you must let the computer know the length of the array!!!!
int totalNumber = 10;
float[] circleSizes = new float[ totalNumber ];  // new float[10];

// assign values!
for (int i=0; i<circleSizes.length; i++) {
  circleSizes[i] = 10;
}

// let's get the values!
for (int i=0; i<circleSizes.length; i++) {
  println( circleSizes[i] );
}
