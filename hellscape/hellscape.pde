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
  pattern.generate(width/2, 0, Pattern.semiCircleDown, 3, 0, 20);
  pattern.generate(width/2, height, Pattern.semiCircleUp, 3, 1000, 30);

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