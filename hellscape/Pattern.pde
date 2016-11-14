class Pattern {
  final static int semiCircleDown = 0;
  final static int semiCircleUp = 1;
  final static int fullCircle = 2;
  
  ArrayList<Bullet> bullets;
  
  Pattern() {
    bullets = new ArrayList<Bullet>();
  }
  
  void generate(int x, int y, int type, int speed, float wait, int spread, float singleWait) {
    float w = wait;
    if (type == semiCircleDown) {
      for (float angle = 0; angle <= PI; angle += PI/spread) {
        bullets.add(new Bullet(x, y, cos(angle)*speed, sin(angle)*speed, w));
        w += singleWait;
      }
    } else if (type == semiCircleUp) {
      for (float angle = PI; angle <= TAU; angle += PI/spread) {
        bullets.add(new Bullet(x, y, cos(angle)*speed, sin(angle)*speed, w));
        w += singleWait;
      }
    } else if (type == fullCircle) {
      for (float angle = 0; angle <= TAU; angle += TAU/spread) {
        bullets.add(new Bullet(x, y, cos(angle)*speed, sin(angle)*speed, w));
        w += singleWait;
      }
    }
  }
  
  void tick() {
    Iterator<Bullet> i = pattern.bullets.iterator();
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
}