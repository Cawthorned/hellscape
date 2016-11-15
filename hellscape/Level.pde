class Level {
  Pattern pattern;
  float randomTimer = 1000;
  int lastRandom = -1;
  int score = 0;
  int startTime = 0;
  
  Level() {
    pattern = new Pattern();
  }

  void start(int diff) {
    startTime = millis();
    if (diff == -1) { // Random
      genRandom();
      lastRandom = millis();
    }
    else if (diff == 1){
      //pattern.generate(x, y, type, speed, wait, spread, singleWait)
      int s = 2;
      int w = millis();
      pattern.generate(width/2, 0, 0, s, w, 50, 25);
      pattern.generate(width/2, height, 0, s, w+3000, 50, 25);
      pattern.generate(0, height/2, 1, s, w+6000, 50, 20);
      pattern.generate(width, height/2, 1, s, w+9000, 50, 20);
      pattern.generate(0, 0, 2, s, w+14000, 50, 30);
      pattern.generate(0, height, 2, s, w+15000, 40, 30);
      pattern.generate(0, 0, 0, s, w+18000, 50, 25);
      pattern.generate(width, height, 1, s, w+18000, 50, 25);
    }
    else if (diff == 2){
      
    }
  }
  
  void stop() {
    pattern.clear();
    randomTimer = -1;
    randomTimer = 1000;
    lastRandom = -1;
  }
  
  void tick() {
    if (lastRandom != -1) {
      if ((float)millis() - lastRandom >= randomTimer) {
        genRandom();
        randomTimer *= 0.999;
        lastRandom = millis();
      }
      score = millis() - startTime;
    }
    pattern.tick();
  }
  
  void display() {
    pattern.display();    
  }
  
  void genRandom() {
    int type = floor(random(0, Pattern.max+1));
    int x = width/2;
    int y = height/2;
    while ((x == y) && ((x==width/2)||(y==height/2))) {
      x = (int)map(floor(random(0, 3)), 0, 2, 0, width);
      y = (int)map(floor(random(0, 3)), 0, 2, 0, height);
    }
    int spread = (int)random(20, 50);
    int singleWait = (int)random(0, 50);
    pattern.generate(x,y,type,3,millis()+1000,spread,singleWait);
  }
}