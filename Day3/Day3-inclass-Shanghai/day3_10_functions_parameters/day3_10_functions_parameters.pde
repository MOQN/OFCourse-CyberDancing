void setup() {
  size(500, 600);
  background(0);
}

void draw() {
  //background(0);
  showRandomText("Nihao!", 30);
  showRandomText("Hi!", 10);
  showRandomText("Ciao!", 15);
  showValues(10,5,1);
}

void showRandomText(String txt, int txtSize) {
  textSize( txtSize );
  text( txt, random(width), random(height) );
}

// ONLY ORDER MATTERS!!!!!!!!!!!!!!!!!!!
void showValues(int valueFirst, int valueSecond, int valueThird) {
  println(valueFirst + " " + valueSecond + " " + valueThird);
}
