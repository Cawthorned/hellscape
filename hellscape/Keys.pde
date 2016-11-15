class Keys {
  boolean up;
  boolean right;
  boolean down;
  boolean left;
  boolean ok;
  
  void change(boolean pressed) {
    if (keyCode == UP) {
      up = pressed;
    } else if (keyCode == RIGHT) {
      right = pressed;
    } else if (keyCode == DOWN) {
      down = pressed;
    } else if (keyCode == LEFT) {
      left = pressed;
    } else if (key == ' ' || keyCode == RETURN || keyCode == ENTER) {
      ok = pressed;
    }
  }
  
  void keyPressed() {
    change(true);
  }
  
  void keyReleased() {
    change(false);
  }
}