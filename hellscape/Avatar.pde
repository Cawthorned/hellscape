import java.util.Iterator;

class Avatar {
  float x;
  float y;
  float speed;
  int r = 10;

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
    
    collision();
  }
  
  void collision() {
    Iterator<Bullet> i = pattern.bullets.iterator();
    while (i.hasNext()) {
      Bullet bullet = i.next();
      if (dist(bullet.x, bullet.y, x, y)<bullet.r+r) {
        i.remove();
      }
    }
  }

  void display() {
    ellipse(x, y, r, r);
  }
}