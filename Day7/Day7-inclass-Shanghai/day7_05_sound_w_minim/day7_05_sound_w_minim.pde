// http://code.compartmental.net/minim/audioplayer_class_audioplayer.html

import ddf.minim.*;

Minim mn; 
AudioSample sound1; // short sound to trigger
AudioSample sound2;
AudioPlayer song;   // long music to play 

void setup() {
  size(500, 600);
  background(0);
  
  mn = new Minim(this);
  
  // AudioSamples
  sound1 = mn.loadSample("sound1.wav");
  sound2 = mn.loadSample("sound2.wav");
  
  // AudioPlayers
  song = mn.loadFile("groove.mp3");
  //song.play();
  //song.loop();
  //song.pause();
  //song.rewind();
}

void draw() {
  background(0);
  if (mousePressed) {
    if (mouseX < width/2) {
      sound1.trigger();
      background(255,0,0);
    } else {
      sound2.trigger();
      background(0,0,255);
    }
  }
}

void keyPressed() {
  if ( song.isPlaying() ) {
    song.pause();
    song.rewind();
  } else {
    song.play();
    // song.loop();
  }
}
