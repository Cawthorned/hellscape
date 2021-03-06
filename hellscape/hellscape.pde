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

Highscore highscore;

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
  
  highscore = new Highscore();
}

void draw() {
  surface.setTitle(String.format("Hellscape %.3f fps", frameRate));

  background(0, 100, 200);

  level.tick();
  level.display();
  
  screen.display();
  
  avatar.tick();
  avatar.display();
}

void keyPressed() {
  keys.keyPressed();
}

void keyReleased() {
  keys.keyReleased();
}