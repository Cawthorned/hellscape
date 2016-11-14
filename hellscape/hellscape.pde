Pattern pattern;
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
  
  pattern = new Pattern();
  pattern.generate(width/2, 0, Pattern.semiCircleDown, 3, 0, 20, 50);
  pattern.generate(width/2, height, Pattern.semiCircleUp, 1, 1000, 30, 50);
  pattern.generate(0, 0, Pattern.semiCircleDown, 3, 2000, 30, 50);
  pattern.generate(width, 0, Pattern.semiCircleDown, 3, 2000, 30, 50);
  pattern.generate(width, height, Pattern.semiCircleUp, 3, 2000, 30, 50);
  pattern.generate(0, height, Pattern.semiCircleUp, 3, 2000, 30, 50);
  pattern.generate(width/2, height, Pattern.semiCircleUp, 3, 2000, 30, 50);
}

void draw() {
  surface.setTitle(String.format("Hellscape %.3f fps", frameRate));
  
  background(0, 100, 200);
  avatar.tick();
  avatar.display();

  pattern.tick();
  pattern.display();
  
  screen.display();
}

void keyPressed() {
  keys.keyPressed();
}

void keyReleased() {
  keys.keyReleased();
}