class Screen {
  final static int start = 0;
  final static int gameover = 1;
  final static int hide = -1;
  int current = 0;
  int counter = 0;
  float ranCol = 0;

  Screen(int current_) {
    current = current_;
  }

  void change(int current_) {
    current = current_;
  }

  void display() {
    textAlign(CENTER, CENTER);
    if (ranCol >= 255) {
      ranCol = 0;
    }

    if (current == start) {
      fill(255,100);
      //top left
      if (avatar.x > width/9 && avatar.x < width/9+width/3 && avatar.y > height-height/3-height/20 && avatar.y < (height-height/3-height/20)+height/7) {
        rect(width/9, height-height/3-height/20, width/3, height/7);
        if (keys.ok){
          avatar.reset();
          level.start(1);
          current = hide;
        }
      //top right
      } else if (avatar.x > 5*width/9 && avatar.x < 5*width/9+width/3 && avatar.y > height-height/3-height/20 && avatar.y < (height-height/3-height/20)+height/7) {
        rect(5*width/9, height-height/3-height/20, width/3, height/7);
        if (keys.ok){
          avatar.reset();
          level.start(2);
          current = hide;
        }
      //bottom left
      } else if (avatar.x > width/9 && avatar.x < width/9+width/3 && avatar.y >height-height/6 && avatar.y < height-height/6+height/7) {
        rect(width/9, height-height/6, width/3, height/7);
        if (keys.ok){
          avatar.reset();
          level.start(-1);
          current = hide;
        }
      //bottom right
      } else if (avatar.x > 5*width/9 && avatar.x < 5*width/9+width/3 && avatar.y >height-height/6 && avatar.y < height-height/6+height/7) {
        fill(ranCol, 200, 200, 100);
        rect(5*width/9, height-height/6, width/3, height/7);
        if (keys.ok){
          colorMode((int)random(0,2)==0 ? 1 : 3);
          delay(200);
        }
        ranCol++;
      }
      fill(0);
      textFont(titleFont);
      text("hellscape", width/2, height/7);
      textFont(textFont);
      text("beginner mode", width/9, height-height/3-height/20, width/3, height/7);
      text("survival mode", width/9, height-height/6, width/3, height/7);
      text("mystery button", 5*width/9, height-height/6, width/3, height/7);
      text("supermassive\nmega-explosion", 5*width/9, height-height/3-height/20, width/3, height/7);
      text("Welcome to hellscape,\n the game where you are a droplet in a sea of fire\n and must take care not to be evaporated. \nYou move the droplet with the ARROW keys. \nTo click on a button, press SPACEBAR.", width/2, height/3+height/12);
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