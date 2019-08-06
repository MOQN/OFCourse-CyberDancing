
class Button {
  float x, y, z;
  float area;
  color clr;
  int hitCount;
  int numOfPixelsInArea = 1000;
  boolean prevState;

  Button(float _x, float _y, float _area) {
    x = _x;
    y = _y;
    area = _area;
    clr = color(255, 255, 0);
    prevState = false;
  }
  void display() {
    pushStyle();
    if (prevState) {
      strokeWeight(5);
      stroke(clr);
    } else {
      strokeWeight(1);
      stroke(clr, 150);
    }
    
    noFill();
    ellipse(x, y, area, area);
    fill(clr);
    textSize(15);
    text(hitCount, x, y);
    popStyle();
  }
  void checkDistance(float tX, float tY) {
    float distance = dist(x, y, tX, tY);
    if (distance < area/2) {
      hitCount++;
    }
  }
  int checkButtonState() {
    boolean currState = false;
    if (hitCount > numOfPixelsInArea) {
      currState = true;
    } else {
      currState = false;
    }

    if (prevState && currState) {
      prevState = currState;
      return 1;
    } else if (!prevState && currState) {
      prevState = currState;
      // Triggered
      return 2;
    } else if (prevState && !currState) {
      prevState = currState;
      // Released
      return 3;
    } else {
      prevState = currState;
      return 0;
    }
  }
  void resetHitCount() {
    hitCount = 0;
  }
}