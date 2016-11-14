class Screen {
  final static int start = 0;
  final static int gameover = 1;
  int current = 0;
  int counter = 0;
  Screen(int current_) {
    current = current_;
  }

  void display() {
    textAlign(CENTER, CENTER);
    textFont(titleFont);
    if (current == start) {
      text("NAME OF THE GAME", width/2, height/4);
      rect(width/5, 2*height/5, 3*width/5, height/5);
      text("START", width/5, 2*height/5, 3*width/5, height/5);
    }

    if (current == gameover) {
      counter++;
      if (counter >= 150) {
        counter = 150;
      }
      fill(0, counter, 0, counter);
      rect(0, 0, width, height);
      fill(#FFFFFF);
      text("Game over", width/2, height/2);
      rect(width/2-width/5, height/2+height/10, width/2.5, 2*height/10);
    }
  }
}