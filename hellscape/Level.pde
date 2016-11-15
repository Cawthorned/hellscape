class Level {
  Pattern pattern;
  float randomTimer = 1000;
  int lastRandom = -1;
  int score;
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
        score = millis() - startTime;
      }
    }
    pattern.tick();
  }
  
  void display() {
    pattern.display();    
  }
  
  void genRandom() {
    int type = floor(random(0, Pattern.max));
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