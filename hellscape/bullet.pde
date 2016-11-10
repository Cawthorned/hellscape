class Bullet {
  float x;
  float y;
  float r;
  float speedx;
  float speedy;
  float wait;
  float start;
  boolean exist = false;

  Bullet(float x_, float y_, float speedx_, float speedy_, float wait_, float r_) {
    x = x_;
    y = y_;
    r = r_;
    speedx = speedx_;
    speedy = speedy_;
    wait = wait_;
    start = millis();
  }
  
  Bullet(float x_, float y_, float speedx_, float speedy_, float wait_) {
    x = x_;
    y = y_;
    r = 8;
    speedx = speedx_;
    speedy = speedy_;
    wait = wait_;
    start = millis();
  }

  void tick() {
    if (millis() > start + wait) {
      exist = true;
    }
    
    if (exist) {
      x = x + speedx;
      y = y + speedy;
    }
  }

  void display() {
    if (exist) {
      fill(255);
      ellipse(x, y, r, r);
    }
  }
}