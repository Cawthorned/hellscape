class Pattern {
  final static int semiCircleDown = 0;
  final static int semiCircleUp = 1;
  
  ArrayList<Bullet> bullets;
  
  Pattern() {
    bullets = new ArrayList<Bullet>();
  }
  
  void generate(int x, int y, int type, int speed, float wait, int spread) {
    if (type == semiCircleDown) {
      for (float angle = 0; angle <= PI; angle += PI/spread) {
        println(angle);
        bullets.add(new Bullet(x, y, cos(angle)*speed, sin(angle)*speed, wait));
      }
    } else if (type == semiCircleUp) {
      for (float angle = PI; angle <= TAU; angle += PI/spread) {
        println(angle);
        bullets.add(new Bullet(x, y, cos(angle)*speed, sin(angle)*speed, wait));
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