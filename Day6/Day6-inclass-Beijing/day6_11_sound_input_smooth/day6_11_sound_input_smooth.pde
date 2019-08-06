import ddf.minim.*;

Minim mn;
AudioPlayer song;

float circleSize = 0;

void setup() {
  size(500, 600);
  background(0);
  
  mn = new Minim(this);
  song = mn.loadFile("groove.mp3");
  song.loop();
}

void draw() {
  background(0);
  
  float volumeL = song.left.level();
  float volumeR = song.right.level();
  float volume = (volumeL + volumeR)/2;  // % 0.0 to 1.0
  float newSize = map(volume, 0, 1, 1, 600);
  
  circleSize = lerp(circleSize, newSize, 0.1);
  
  ellipse(width/2, height/2, circleSize, circleSize);
}
