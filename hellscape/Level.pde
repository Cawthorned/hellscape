class Level {
  Pattern pattern;
  float randomTimer = 1000;
  int lastRandom = -1;
  int score = 0;
  int startTime = 0;
  int randomWeight[] = {0, 0, 1, 1, 2, 3};
  
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
      int w = millis()-200;
      //ms for a beat since the song has 120 BPM and this makes it easier to make it follow rythm. (436)
      int b = 500;
      pattern.generate(width/2, 0, 1, s, w+9*b, 50, 15);
      pattern.generate(width/2, height, 0, s, w+17*b, 50, 15);
      pattern.generate(0, height/2, 1, s, w+25*b, 50, 20);
      pattern.generate(width, height/2, 1, s, w+33*b, 50, 20);
      pattern.generate(0, 0, 3, s, w+37*b, 50, 10);
      pattern.generate(0, height, 3, s, w+37*b, 40, 10);
      pattern.generate(0, 0, 0, s, w+45*b, 50, 15);
      pattern.generate(width, height, 1, s, w+49*b, 50, 15);
      pattern.generate(width, 0, 0, s, w+53*b, 60, 15);
      pattern.generate(0, height, 1, s, w+53*b, 40, 10);
      pattern.generate(width/2, 0, 1, s, w+57*b, 50, 20);
      pattern.generate(width/2, 0, 1, s, w+59*b, 40, 10);
      pattern.generate(width/2, height, 0, s, w+63*b, 50, 20);
      pattern.generate(width/2, height, 0, s, w+65*b, 40, 10);
      pattern.generate(0, 0, 3, s, w+73*b, 30, 20);
      pattern.generate(width/20, 0, 3, s, w+74*b, 30, 20);
      pattern.generate(0, 0, 3, s, w+75*b, 30, 20);
      pattern.generate(width/20, 0, 3, s, w+76*b, 30, 20);
      pattern.generate(0, height, 2, s, w+77*b, 30, 20);
      pattern.generate(width/20, height, 2, s, w+78*b, 30, 20);
      pattern.generate(0, height, 2, s, w+79*b, 30, 20);
      pattern.generate(width/20, height, 2, s, w+80*b, 30, 20);
      pattern.generate(width, height/2, 0, s, w+85*b, 30, 15);
      pattern.generate(0, height/2, 1, s, w+85*b, 30, 15);
      pattern.generate(width/2, 0, 0, s, w+89*b, 20, 20);
      pattern.generate(width/2, height, 1, s, w+89*b, 20, 20);
      pattern.generate(0, 0, 0, s, w+93*b, 20, 20);
      pattern.generate(width, 0, 0, s, w+94*b, 20, 20);
      pattern.generate(width, height, 0, s, w+95*b, 20, 20);
      pattern.generate(0, height, 0, s, w+96*b, 20, 20);
      pattern.generate(0, 0, 3, s, w+101*b, 30, 20);
      pattern.generate(0, height, 3, s*2, w+101*b, 30, 20);
      pattern.generate(0, 0, 3, s*2, w+101*b, 30, 20);
      pattern.generate(0, height, 3, s, w+101*b, 30, 20);
      pattern.generate(0, 0, 3, s, w+102*b, 30, 20);
      pattern.generate(0, height, 3, s*2, w+102*b, 30, 20);
      pattern.generate(0, 0, 3, s*2, w+103*b, 30, 20);
      pattern.generate(0, height, 3, s, w+103*b, 30, 20);
      pattern.generate(width/2, 0, 0, s, w+111*b, 30, 20);
      pattern.generate(width/2, height, 0, s, w+111*b, 30, 20);
      pattern.generate(0, height/2, 0, s, w+111*b, 30, 20);
      pattern.generate(width, height/2, 0, s, w+111*b, 30, 20);
      pattern.generate(0, 0, 0, s, w+115*b, 30, 20);
      pattern.generate(width, height, 0, s, w+115*b, 30, 20);
      pattern.generate(0, height, 0, s, w+115*b, 30, 20);
      pattern.generate(width, 0, 0, s, w+115*b, 30, 20);
      pattern.generate(width/20, 0, 3, s, w+119*b, 30, 20);
      pattern.generate(0, height, 3, s*2, w+119*b, 30, 20);
      pattern.generate(0, 0, 3, s*2, w+120*b, 30, 20);
      pattern.generate(width/20, height, 3, s, w+120*b, 30, 20);
      pattern.generate(width/20, 0, 3, s, w+121*b, 30, 20);
      pattern.generate(0, height, 3, s*2, w+121*b, 30, 20);
      pattern.generate(0, 0, 3, s*2, w+122*b, 30, 20);
      pattern.generate(width/20, height, 3, s, w+122*b, 30, 20);
      pattern.generate(width/2, height/2, 0, s, w+127*b, 20, 25);
      pattern.generate(width/2, height/2, 1, s, w+127*b, 25, 20);
      pattern.generate(width/2, height/2, 0, s, w+128*b, 20, 25);
      pattern.generate(width/2, height/2, 1, s, w+128*b, 25, 20);
      pattern.generate(width/2, height/2, 0, s, w+129*b, 20, 25);
      pattern.generate(width/2, height/2, 1, s, w+129*b, 25, 20);
      pattern.generate(width/2, height/2, 0, s, w+130*b, 20, 25);
      pattern.generate(width/2, height/2, 1, s, w+130*b, 25, 20);
      pattern.generate(width/2, height/2, 0, s, w+131*b, 20, 25);
      pattern.generate(width/2, height/2, 1, s, w+131*b, 25, 20);
      pattern.generate(width/2, height/2, 0, s, w+132*b, 20, 25);
      pattern.generate(width/2, height/2, 1, s, w+132*b, 25, 20);
      pattern.generate(width/2, height/2, 0, s, w+133*b, 20, 25);
      pattern.generate(width/2, height/2, 1, s, w+133*b, 25, 20);
      pattern.generate(width/2, height/2, 0, s, w+134*b, 20, 25);
      pattern.generate(width/2, height/2, 1, s, w+134*b, 25, 20);
      pattern.generate(0, 0, 0, s*2, w+143*b, 40, 20);
      pattern.generate(width, 0, 0, s*2, w+143*b, 40, 20);
      pattern.generate(width, height, 0, s*2, w+143*b, 40, 20);
      pattern.generate(0, height, 0, s*2, w+143*b, 40, 20);
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
    int type = randomWeight[floor(random(0, randomWeight.length))];
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