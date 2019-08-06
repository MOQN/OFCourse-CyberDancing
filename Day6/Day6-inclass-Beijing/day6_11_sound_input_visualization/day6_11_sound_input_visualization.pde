import ddf.minim.*;

Minim mn;
AudioPlayer song;
AudioInput mic;

void setup() {
  size(500, 600);
  background(0);

  mn = new Minim(this);

  //song = mn.loadFile("groove.mp3");
  //song.loop();

  mic = mn.getLineIn();
}

void draw() {
  //background(0);

  float volumeL = mic.left.level();
  float volumeR = mic.right.level();
  float volume = (volumeL + volumeR)/2;  // % 0.0 to 1.0

  if (volume > 0.1) {
    float size = map(volume, 0, 1, 1, 100);
    ellipse(random(width), random(height), size, size);
  }
}
