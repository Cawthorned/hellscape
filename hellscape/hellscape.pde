Keys keys = new Keys();
void setup() {
  size(720, 720);  
  colorMode(HSB);
  ellipseMode(RADIUS);
}

void draw() {
  background(0, 100, 200);
}

void keyPressed() {
  keys.keyPressed();
}

void keyReleased() {
  keys.keyReleased();
}