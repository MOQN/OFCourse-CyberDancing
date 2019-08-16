class Button {
  float posX, posY;
  float rad;
  int hitCount;
  boolean state;
  color clr;

  Button(float _x, float _y, float _rad) {
    posX = _x;
    posY = _y;
    rad = _rad;
    clr = color(random(255), random(255), random(255));

    hitCount = 0;
    state = false;
  }

  void checkDistance(float otherX, float otherY) {
    float distance = dist(posX, posY, otherX, otherY);
    if (distance < rad) {
      hitCount++;
    }
  }

  void updateHitState() {
    int threshold = 1000; // triggering threshold
    if (hitCount > threshold) {
      state = true;
    } else {
      state = false;
    }
    displayHitCount();
    
    hitCount = 0;
  }
  
  void displayHitCount() {
    pushStyle();
    fill(255);
    textSize(20);
    text(hitCount, posX + rad + 10, posY);
    popStyle();
  }
  
  void display() {
    pushStyle();
    if (state) {
      noStroke();
      fill(clr);
    } else {
      strokeWeight(3);
      stroke(clr);
      noFill();
    }
    ellipse(posX, posY, rad*2, rad*2);
    popStyle();
  }
}