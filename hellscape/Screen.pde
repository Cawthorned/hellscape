class Screen {
  final static int start = 0;
  final static int gameover = 1;
  int current = 0;
  int counter = 0;
  Screen(int current_) {
    current = current_;
  }

  void change(int current_) {
    current = current_;
  }

  void display() {
    textAlign(CENTER, CENTER);
    
    if (current == start) {
      fill(0);
      textFont(titleFont);
      text("hellscape", width/2, height/7);
      //text("START", width/5, 2*height/5, 3*width/5, height/5);
      textFont(textFont);
      text("Welcome to hellscape,\n the game where you are a droplet in a sea of fire\n and must take care not to be evaporated. \nYou move the droplet with the ARROW keys. \nTo click on a button, click SPACEBAR.", width/2, height/3+height/12);
      noFill();
      stroke(0);
      strokeWeight(5);
      rect(width/9, height-height/3-height/20, width/3, height/7);
      rect(5*width/9, height-height/3-height/20, width/3, height/7);
      rect(width/9, height-height/6, width/3, height/7);
      rect(5*width/9, height-height/6, width/3, height/7);
      
  }

    if (current == gameover) {
      counter++;
      if (counter >= 150) {
        counter = 150;
      }
      fill(0, counter, 0, counter);
      rect(0, 0, width, height);
      fill(#FFFFFF);
      textFont(titleFont);
      text("Game over", width/2, height/4);
      rect(width/2-width/5, height/2+height/10, width/2.5, 2*height/10);
    }
  }
}