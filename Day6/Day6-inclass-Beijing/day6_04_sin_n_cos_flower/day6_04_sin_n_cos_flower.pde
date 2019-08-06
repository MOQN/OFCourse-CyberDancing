void setup() {
  size(500, 600);
  background(0);
}

void draw() {
  //background(0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount * 0.01);
  for (int a = 0; a < 360; a+=72) {
    float freq, amp;
    
    freq = frameCount * 0.02;
    amp = 60;
    float sinForAmp = sin(freq) * amp;
    
    freq = radians(a); // deg --> rad
    amp = 150 + sinForAmp; // radius
    float sinVal = sin(freq) * amp;
    float cosVal = cos(freq) * amp;

    float x = cosVal;
    float y = sinVal;
    
    stroke(255, 50);
    line(0, 0, x, y);
    ellipse(x, y, 2, 2);
  }
  popMatrix();
}
