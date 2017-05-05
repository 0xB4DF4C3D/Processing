import java.util.Random;

Random generator;

void setup() {
  size(640, 360);
  generator = new Random();
}

void draw() {
  float numx = (float) generator.nextGaussian();
  float numy = (float) generator.nextGaussian();
  float sd = 60;
  float meanx = width/2;
  float meany = height/2;

  float x = sd * numx + meanx;
  float y = sd * numy + meany;

  noStroke();
  fill(255, 10);
  ellipse(x, y, 16, 16);
}

