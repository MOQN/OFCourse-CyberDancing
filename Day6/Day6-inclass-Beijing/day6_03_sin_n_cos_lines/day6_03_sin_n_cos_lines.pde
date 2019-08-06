void setup() {
  size(500, 600);
  background(100);
}

void draw() {
  background(100);

  for (int a = 0; a < 360; a+=1) {
    float freq, amp;
    freq = radians(a); // deg --> rad
    amp = 150; // radius
    
    float sinVal = sin(freq) * amp;
    float cosVal = cos(freq) * amp;

    float x = width/2 + cosVal;
    float y = height/2 + sinVal;
    
    amp = 150 + random(5, 15);
    float sinVal1 = sin(freq) * amp;
    float cosVal1 = cos(freq) * amp;
    
    float x1 = width/2 + cosVal1;
    float y1 = height/2 + sinVal1;
    
    stroke(255);
    line(x,y,x1,y1);
  }
}
