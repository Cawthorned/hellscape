import java.util.Iterator;

class Avatar {
  float x;
  float y;
  float speed;
  int r = 10;
  int lastDeath = -1000;
  int invTime = 1000;
  color col;
  color baseCol;

  Avatar(float x_, float y_, float speed_) {
    x = x_;
    y = y_;
    speed = speed_;
    col = color(255, 255, 255, 255);
    baseCol = col;
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
    
    if (millis() < lastDeath + invTime) {
      col = color(col, 20);
    } else {
      col = baseCol;
    }
    
    checkBounds();
  }
  
  void collision() {
    Iterator<Bullet> i = pattern.bullets.iterator();
    while (i.hasNext()) {
      Bullet bullet = i.next();
      if (bullet.exist) {
        if (dist(bullet.x, bullet.y, x, y)<bullet.r+r) {
          if (millis() >= lastDeath + invTime) {
            i.remove();
            lastDeath = millis();
          }
        }
      }
    }
  }
  
  void checkBounds() {
    if (x - r <= 0) {
      x = r;
    }
    if (x + r >= width) {
      x = width-r;
    }
    if (y - r <= 0) {
      y = r;
    }
    if (y + r >= height) {
      y = height-r;
    }
  }

  void display() {
    noStroke();
    fill(col);
    ellipse(x, y, r, r);
  }
}