// http://code.compartmental.net/minim/audioplayer_class_audioplayer.html

import ddf.minim.*;

Minim mn;

AudioPlayer song;     // to play
AudioSample sound1;   // to trigger
AudioSample sound2;

void setup() {
  size(500, 600);
  background(0);

  mn = new Minim(this);

  song = mn.loadFile("groove.mp3");
  sound1 = mn.loadSample("sound1.wav");
  sound2 = mn.loadSample("sound2.wav");

  // how to control AudioPlayer (file)
  // song.play();
  // song.loop();
  // song.pause();
  // song.rewind();
  // song.length();    // get the duration(sec) of the audio file
  // song.position();  // get the current position
  // song.isPlaying(); // return true if the audio file is being played.
}

void draw() {
  background(0);

  if (mousePressed) {
    if (mouseX < width/2) {
      // left side
      sound1.trigger();
      background(255, 0, 0);
    } else {
      // right side
      sound2.trigger();
      background(0, 0, 255);
    }
  }
}

void keyPressed() {
  // toggling the audio file
  if ( song.isPlaying() ) {
    // stop!
    song.pause();
    song.rewind();
  } else {
    // play!
    song.play();
  }
}
