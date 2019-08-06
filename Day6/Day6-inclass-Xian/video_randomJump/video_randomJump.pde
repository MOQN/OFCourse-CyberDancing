import processing.video.*;

Movie video;

void setup() {
  size(800, 600);
  background(0);
  
  video = new Movie(this, "sample.mp4");
  video.loop();
  //video.pause();
  //video.play();
  //video.jump(1.0);  // move to the position at 1.0 second
  //video.duration(); // get the duration of the movie file
}

void draw() {
  if (video.available() == true) {
    video.read(); 
  }
  
  background(0);
  // show the movie file
  image(video, 0, 0, width, height);
}

void mousePressed() {
  float randomPosition = random( 0, video.duration() );
  video.jump( randomPosition );
}
