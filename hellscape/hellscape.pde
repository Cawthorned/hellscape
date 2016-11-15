import java.util.Iterator;
import ddf.minim.*;
import ddf.minim.ugens.*;

Keys keys;
Sound sound;
Screen screen;
Avatar avatar;
Level level;

PFont titleFont;
PFont textFont;

void setup() {
  size(720, 720);
  //fullScreen();
  colorMode(HSB);
  ellipseMode(RADIUS);

  titleFont = createFont("orangejuice.ttf", height/5.5);
  textFont = createFont("orangejuice.ttf", height/20);

  keys = new Keys();
  
  sound = new Sound(this);

  screen = new Screen(Screen.start);

  avatar = new Avatar(3.2);

  level = new Level();
}

void draw() {
  surface.setTitle(String.format("Hellscape %.3f fps", frameRate));

  background(0, 100, 200);

  screen.display();

  avatar.tick();
  avatar.display();

  level.tick();
  level.display();
}

void keyPressed() {
  keys.keyPressed();
}

void keyReleased() {
  keys.keyReleased();
}