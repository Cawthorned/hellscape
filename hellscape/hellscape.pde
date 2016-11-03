Keys keys = new Keys();
Avatar avatar;
void setup() {
  size(720, 720);  
  colorMode(HSB);
  ellipseMode(RADIUS);
  
  avatar = new Avatar(10);
}

void draw() {
  background(0, 100, 200);
  avatar.tick();
  avatar.display();
}

void keyPressed() {
  keys.keyPressed();
}

void keyReleased() {
  keys.keyReleased();
}