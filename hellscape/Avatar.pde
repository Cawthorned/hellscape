class Avatar {
  float x;
  float y;
  float speed;

  Avatar(float x_, float y_, float speed_) {
    x = x_;
    y = y_;
    speed = speed_;
  }
  
  Avatar(float speed_) {
    x = width/2;
    y = height/2;
    speed = speed_;
  }

  void tick() {
    if (keys.up) {
      y -= speed;
    }
    if (keys.right) {
      x += speed;
    }
    if (keys.down) {
      y += speed;
    }
    if (keys.left) {
      x -= speed;
    }
  }

  void display() {
    ellipse(x, y, 10, 10);
  }
}