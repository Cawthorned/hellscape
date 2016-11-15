void heart(float x, float y, boolean half) {
  pushMatrix();
  float s = (height+width)/750;
  translate(x-50*s, y-20*s);
  beginShape();
  if (!half) {
    vertex(50*s, 15*s);
    bezierVertex(50*s, -5*s, 90*s, 5*s, 50*s, 40*s); // Right
  }
  vertex(50*s, 15*s);
  bezierVertex(50*s, -5*s, 10*s, 5*s, 50*s, 40*s); // Left
  endShape();
  popMatrix();
}