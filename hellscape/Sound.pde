class Sound {
  Minim minim;
  AudioOutput out;
  
  AudioPlayer main;
  AudioPlayer easy;
  AudioPlayer hard;
  AudioPlayer[] rand;
  AudioPlayer mystery;
  
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
    rand[0].setGain(-20);
    
    mystery = minim.loadFile("sound/Disco Medusae.mp3"); // or maybe "Disco Lounge.mp3"
    
    out = minim.getLineOut();
    
    drip = new Sampler("sound/drip.wav", 5, minim);
    
    drip.patch(out);
  }
  
  void play(int l) {
    if ((l == -99) && (playing == -99)) {
      l = 0;
      mystery.pause();
    }
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
      }
    }
  }
  
  void stop() {
    main.pause();
    easy.pause();
    hard.pause();
    for (int i=0; i<=rand.length-1; i++) {
      rand[i].pause();
    }
  }
  
  void drip() {
    drip.trigger();
  }
}