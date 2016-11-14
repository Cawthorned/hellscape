Level level;
Keys keys = new Keys();
Avatar avatar;
Screen screen;
PFont titleFont;
PFont textFont;

void setup() {
  size(720, 720);
  //fullScreen();
  colorMode(HSB);
  ellipseMode(RADIUS);

  titleFont = createFont("orangejuice.ttf", height/5.5);
  textFont = createFont("orangejuice.ttf", height/20);
  
  screen = new Screen(screen.start);
  
  avatar = new Avatar(3.2);
  
  level = new Level();
  level.start(-1);
  
  
  println();
}

void draw() {
  surface.setTitle(String.format("Hellscape %.3f fps", frameRate));
  
  //background(0, 100, 200);
  avatar.tick();
  avatar.display();

  level.tick();
  level.display();
  
  screen.display();
}

void keyPressed() {
  keys.keyPressed();
}

void keyReleased() {
  keys.keyReleased();
}