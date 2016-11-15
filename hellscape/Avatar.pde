class Avatar {
  float x;
  float y;
  float speed;
  int r = 5;
  int lastDeath = -1000;
  int invTime = 1000;
  color col;
  color baseCol;
  int lives;

  Avatar(float speed_) {
    speed = speed_;
    reset();
    col = color(170, 200, 200);
    baseCol = col;
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
      col = color(baseCol, (frameCount % 5)*50);
    } else {
      col = baseCol;
    }

    checkBounds();
  }

  void collision() {
    boolean shouldDie = false;
    Iterator<Bullet> i = level.pattern.bullets.iterator();
    while (i.hasNext()) {
      Bullet bullet = i.next();
      if (bullet.exist) {
        if (dist(bullet.x, bullet.y, x, y)<bullet.r+r) {
          if (millis() >= lastDeath + invTime) {
            i.remove();
            shouldDie = true;
          }
        }
      }
    }
    if (shouldDie)
      die();
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

  void reset() {
    x = width/2;
    y = width/2;
    lives = 2;
  }

  void die() {
    println(lives);
    lives--;
    lastDeath = millis();
    if (lives <= 0) {
      level.stop();
      reset();
      screen.change(Screen.gameover);
    } else {
      sound.drip();
    }
  }
}