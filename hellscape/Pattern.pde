class Pattern {
  final static int semiCircle = 0;
  
  ArrayList<Bullet> bullets;
  
  Pattern() {
    bullets = new ArrayList<Bullet>();
  }
  
  void generate(int x, int y, int type, int speed) {
    if (type == semiCircle) {
      for (float angle = HALF_PI + PI; angle <= TAU + HALF_PI; angle += PI/40) {
        println(angle);
        bullets.add(new Bullet(x, y, sin(angle)*speed, cos(angle)*speed));
      }
    }
  }
  
  void tick() {
    for (Bullet bullet : bullets) {
      bullet.tick();
    }
  }
  
  void display() {
    for (Bullet bullet : bullets) {
      bullet.display();
    }
  }
}