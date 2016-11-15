class Pattern {
  final static int circle = 0;
  final static int circleC = 1;
  final static int wall = 2;
  final static int max = 2;

  ArrayList<Bullet> bullets;

  Pattern() {
    bullets = new ArrayList<Bullet>();
  }

  void generate(int x, int y, int type, int speed, int wait, int spread, int singleWait) {
    float w = wait;
    if (type == circle) {
      for (float angle = 0; angle <= TAU; angle += TAU/spread) {
        bullets.add(new Bullet(x, y, cos(angle)*speed, sin(angle)*speed, w));
        w += singleWait;
      }
    } else if (type == circleC) {
      for (float angle = TAU; angle >= 0; angle -= TAU/spread) {
        bullets.add(new Bullet(x, y, cos(angle)*speed, sin(angle)*speed, w));
        w += singleWait;
      }
    } else if (type == wall) {
      if (y == height/2 && x == 0) {
        y = 0;
      }
      if (y == height/2 && x == width) {
        y = height;
      }
      w = w + (width*2)/(width/spread*3)*singleWait;
      singleWait = -singleWait;
      for (int c = -width; c <= width; c+=(width/spread*3)) {
        bullets.add(new Bullet(x+c, y, 0, speed, w));
        w+= singleWait;
      }
      for (int c = -width; c <= width; c+=(width/spread*3)) {
        bullets.add(new Bullet(x+c, y, 0, -speed, w));
        w+= singleWait;
      }
    }
  }

  void tick() {
    Iterator<Bullet> i = bullets.iterator();
    while (i.hasNext()) {
      Bullet bullet = i.next();
      bullet.tick();
      // Check if bullets are still relevant
      if (bullet.shouldDie()) {
        i.remove();
      }
    }
  }

  void display() {
    for (Bullet bullet : bullets) {
      bullet.display();
    }
  }

  void clear() {
    bullets.clear();
  }
}