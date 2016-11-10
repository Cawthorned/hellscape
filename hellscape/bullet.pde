class Bullet {
  float x;
  float y;
  float r;
  float speedx;
  float speedy;

  Bullet(float x_, float y_, float speedx_, float speedy_, float r_) {
    x = x_;
    y = y_;
    r = r_;
    speedx = speedx_;
    speedy = speedy_;
  }
  
  Bullet(float x_, float y_, float speedx_, float speedy_) {
    x = x_;
    y = y_;
    r = 8;
    speedx = speedx_;
    speedy = speedy_;
  }

  void tick() {
    x = x + speedx;
    y = y + speedy;
  }

  void display() {
    ellipse(x, y, r, r);
  }
}