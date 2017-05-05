import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Random; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Gauss_VS_Normal extends PApplet {


Random Generator;
boolean MouseToggle = true;

public void setup() {
  size(400, 400);
  smooth();
  noStroke();
  Generator = new Random();
  background(10);
}

public void draw() {
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

public void mousePressed() {
  MouseToggle = !MouseToggle;
  background(0);
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Gauss_VS_Normal" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
