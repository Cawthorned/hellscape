class Sound {
  SoundFile main;
  SoundFile easy;
  SoundFile hard;
  SoundFile[] rand;
  SoundFile mystery;
  
  int playing = 0;
  
  Sound(PApplet applet) {
    main = new SoundFile(applet, "sound/Quinns Song-A New Man.mp3");
    easy = new SoundFile(applet, "sound/Ultra Polka.mp3"); // Placeholder
    hard = new SoundFile(applet, "sound/Club Diver.mp3");
    rand = new SoundFile[1];
    rand[0] = new SoundFile(applet, "sound/Ultra Polka.mp3");
    mystery = new SoundFile(applet, "sound/Disco Medusae.mp3"); // or maybe "Disco Lounge.mp3"
  }
  
  void play(int l) {
    playing = l;
    stop();
    if (l == 0) {
      main.loop();
    } else if (l == -1) {
      rand[(int)random(0, rand.length)].play();
    } else if (l == 1) {
      easy.play();
    } else if (l == 2) {
      hard.play();
    } else if (l == -99) {
      mystery.play();
    }
  }
  
  void tick() {
    if (playing == -1) {
      
    }
  }
  
  void stop() {
    main.stop();
    easy.stop();
    hard.stop();
    for (int i=0; i<=rand.length-1; i++) {
      rand[i].stop();
    }
    mystery.stop();
  }
}