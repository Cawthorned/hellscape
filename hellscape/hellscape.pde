Pattern pattern;
Keys keys = new Keys();
Avatar avatar;

PFont titleFont;

void setup() {
  size(720, 720);
  colorMode(HSB);
  ellipseMode(RADIUS);
  
  titleFont = createFont("orangejuice.tff", 32);
  
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
}

void keyPressed() {
  keys.keyPressed();
}

void keyReleased() {
  keys.keyReleased();
}