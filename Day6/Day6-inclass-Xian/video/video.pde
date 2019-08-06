import processing.video.*;

Movie video;

void setup() {
  size(800, 600);
  background(0);
  
  // load a movie file
  video = new Movie(this, "roma_dance.mp4");
  // control
  video.loop();
  //video.pause();
  //video.play();
  //video.jump(1.0);  // move to the position at 1.0 second
  //video.duration(); // get the duration of the movie file
}

void draw() {
  background(0);
  // check whether the frame is updated
  // and if it's updated, get the frame!
  if (video.available() == true) {
    video.read(); 
  }
  
  // show the movie file
  //tint(255,0,255);
  image(video, 0, 0, width, height);
  // image( img, x, y );
  // image( img, x, y, w, h ); // a bit slow
  
  //filter(INVERT);
}
