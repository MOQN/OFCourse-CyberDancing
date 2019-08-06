import ddf.minim.*;

// DataType nameVariables;
Minim mn; 
AudioSample sound1;
AudioSample sound2;
AudioPlayer song;

void setup() {
  size(400, 600);
  background(0);
  
  mn = new Minim(this);
  sound1 = mn.loadSample("sound.wav");
  sound2 = mn.loadSample("SD.wav");
  
  song = mn.loadFile("groove.mp3");
  song.play();
  //song.pause();     // pause the soundfile
  //song.rewind();    // get back to the first position
  //song.position();  // get the current position
  //song.length();    // get the total duration of the soundfile
  
  // e.g. how do we make the song loop?
  /*
  if (song.position() == song.length()) {
    // if the song is finished,
    song.rewind();
    song.play();
    // play it again!
  }
  */
}

void draw() {
  //background(0);
}

void mousePressed() {
  if (mouseX < width/2) {
    sound1.trigger();
    background(255,0,0);
  } else {
    sound2.trigger();
    background(255,0,255);
  }
}
