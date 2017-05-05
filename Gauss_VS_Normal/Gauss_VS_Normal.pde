import java.util.Random;
Random Generator;
boolean MouseToggle = true;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  Generator = new Random();
  background(10);
}

void draw() {
  if (MouseToggle) {
    fill(random(255), random(255), random(255), random(255));
    float x = (float) Generator.nextGaussian();
    float y = (float) Generator.nextGaussian();
    float mean = width/2;
    float sd = 40;
    x = mean + x*sd;
    y = mean + y*sd;
    text("The Gaussian Distribution", 0, 10);
    ellipse(x, y, 10, 10);
    fill(0, 5);
    rect(0, 0, width, height);
  } else {
    fill(random(255), random(255), random(255), random(255));
    float x = random(width);
    float y = random(height);
    text("The Normal Distribution", 0, 10);
    ellipse(x, y, 10, 10);
    fill(0, 5);
    rect(0, 0, width, height);
  }
}

void mousePressed() {
  MouseToggle = !MouseToggle;
  background(0);
}

