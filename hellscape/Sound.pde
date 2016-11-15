class Sound {
  Minim minim;
  AudioOutput out;
  
  AudioPlayer main;
  AudioPlayer easy;
  AudioPlayer hard;
  AudioPlayer[] rand;
  AudioPlayer mystery;
  AudioPlayer gameover;
  
  Sampler drip;
  Sampler hiss;
  
  int playing = 0;
  
  Sound(PApplet applet) {
    minim = new Minim(applet);
    
    main = minim.loadFile("sound/Quinns Song-A New Man.wav");
    easy = minim.loadFile("sound/Overriding Concern_cropped.wav");
    hard = minim.loadFile("sound/Club Diver.mp3");
    rand = new AudioPlayer[1];
    rand[0] = minim.loadFile("sound/Ultra Polka.mp3");
    rand[0].setGain(-15);
    mystery = minim.loadFile("sound/Disco Medusae.mp3"); // or maybe "Disco Lounge.mp3"
    gameover = minim.loadFile("sound/Seven March.mp3");
    
    out = minim.getLineOut();
    
    drip = new Sampler("sound/drip.wav", 5, minim);
    
    drip.patch(out);
  }
  
  void play(int l) {
    if ((playing != -99) || (l == 0)) {
      playing = l;
      stop();
      if (l == 0) {
        main.loop(3);
      } else if (l == -1) {
        rand[(int)random(0, rand.length)].loop();
      } else if (l == 1) {
        easy.play();
      } else if (l == 2) {
        hard.play();
      } else if (l == -99) {
        mystery.loop();
      } else if (l == -2) {
        gameover.loop();
      }
    }
  }
  
  void stop() {
    main.pause();
    easy.pause();
    easy.rewind();
    hard.pause();
    hard.rewind();
    for (int i=0; i<=rand.length-1; i++) {
      rand[i].pause();
      rand[i].rewind();
    }
    gameover.pause();
    mystery.pause();
  }
  
  void drip() {
    drip.trigger();
  }
}