import ddf.minim.*;

Minim mn;
AudioInput in;

void setup() {
  size(500, 300);

  mn = new Minim(this);
  in = mn.getLineIn();
}

void draw() {
  background(0);
  
  float volumeL = in.left.level();
  float volumeR = in.right.level();
  float volume = (volumeL + volumeR)/2; // 0.0 to 1.0 //0% - 100%
  
  float rectWidthL = map(volumeL, 0.0, 1.0, 0, width);
  float rectWidthR = map(volumeL, 0.0, 1.0, 0, width);
  float rectWidthBoth = map(volume, 0.0, 1.0, 0, width);
  
  noStroke();
  fill(255,0,0);
  rect(0, 0, rectWidthL, 150);
  fill(0,0,255);
  rect(0, height/2, rectWidthR, 150);
  fill(255);
  rect(0, 50, rectWidthBoth, 200);
  
  noFill();
  stroke(255);
  ellipse(width/2, height/2, 300 * volume, 300 * volume); 
  
}
