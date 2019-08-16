int seq = 0;

void setup() {
  size(500, 600);
  background(0);
}

void draw() {
 
  switch (seq) {
  case 1:
    scene1();
    break;
  case 2:
    scene2();
    break;
  case 3:
    scene3();
    break;
  case 4:
    scene4();
    break;
  default:
    background(random(255));
  }

  /*
  if (seq == 1) {
   scene1();
   }
   else if (seq == 2) {
   scene2();
   }
   else if (seq == 3) {
   scene3();
   }
   else if (seq == 4) {
   scene4();
   }
   */
}

void mousePressed() {
  seq++;
  if (seq > 4) {
    seq = 0;
  }
}

void scene1() {
  background(0, 0, 255);
  fill(255);
  noStroke();
  textSize(80);
  text("There was..", 10, 120 );
}

void scene2() {
  background(0, 255, 255);
  fill(255);
  noStroke();
  textSize(80);
  text("A Kinect.", 10, 120 );
}

void scene3() {
  background(255, 0, 255);
  fill(255);
  noStroke();
  textSize(80);
  text("That's it.", 10, 120 );
}

void scene4() {
  background(0);
  fill(255);
  noStroke();
  textSize(80);
  text("fin.", 10, 120 );
}
