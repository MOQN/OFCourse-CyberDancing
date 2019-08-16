// DataType nameVariable;

int num1 = 10;
// whole numbers: 1, 5, 0, 1000, -34123, 234, 682
float num2 = 3.14;
// floating point numbers: 3.14, -3.3423, 123.7434
String txt = "Moon";


void setup() {
  size(500, 600);
  background(0);
  
  //num1 = num2; // not possible
  num2 = num1;   // possible!
  println(num1);
  
  //txt = txt + " Sun";
  //txt = 20 + txt + 19;
  txt = 20 + 19 + txt; // *****
  println(txt);
  //txt = "20" + "19" + txt; // *****
  //println(txt);
  // 20 + 19 = 39, and then 39 + txt = "39Moon"
}

void draw() {
  background(0);
  text( txt, 10, 20 ); // (variable, x, y)
}
