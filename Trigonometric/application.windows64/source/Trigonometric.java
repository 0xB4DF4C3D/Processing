import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Trigonometric extends PApplet {

PVector A;
PVector B;
PVector C;


public void setup() {
  size(500, 500); 
  A = new PVector(width/2, height/2); 
  B = new PVector(width, height/2);
  C = new PVector();
  noFill();
  smooth();
}

public void draw() {
  float r;


  background(200);
  strokeWeight(2);
  stroke(200, 0, 0);
  if (mouseY < A.y && mouseX >= width/2) { // 1 dimension
    arc(A.x, A.y, 20, 20, atan2(mouseY - A.y, mouseX - A.x), 0); 
    strokeWeight(1);
    line(C.x, height/2-10, C.x-10, height/2-10);
    line(C.x-10, height/2-10, C.x-10, height/2);
    text("Width : " + (C.x - A.x), mouseX+10, height/2-10);
    
  } else if (mouseY >= A.y  && mouseX >= width/2) { // 4 dimension
    arc(A.x, A.y, 20, 20, atan2(mouseY - A.y, mouseX - A.x), 2*PI);
    strokeWeight(1);
    line(C.x, height/2+10, C.x-10, height/2+10);
    line(C.x-10, height/2+10, C.x-10, height/2);
    text("Width : " + (C.x - A.x), mouseX+10, height/2+20);
    
  } else if (mouseY < A.y  && mouseX < width/2) { // 2 dimension
    arc(A.x, A.y, 20, 20, atan2(mouseY - A.y, mouseX - A.x), 0);
    strokeWeight(1);
    line(C.x, height/2-10, C.x+10, height/2-10);
    line(C.x+10, height/2-10, C.x+10, height/2);
    text("Width : " + (C.x - A.x), mouseX+10, height/2-10);
    
  } else if (mouseY >= A.y  && mouseX < width/2) {// 3 dimension
    arc(A.x, A.y, 20, 20, atan2(mouseY - A.y, mouseX - A.x), 2*PI);
    strokeWeight(1);
    line(C.x, height/2+10, C.x+10, height/2+10);
    line(C.x+10, height/2+10, C.x+10, height/2);
    text("Width : " + (C.x - A.x), mouseX+10, height/2+20);
  }

  C.set(mouseX, mouseY);
  line(A.x, A.y, C.x, C.y);
  line(C.x, C.y, C.x, B.y);

  stroke(0);
  strokeWeight(1);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);

  r = PVector.dist(C, A);

  text("dist : " + r, mouseX + 20, mouseY-10);
  text("height : " + (A.y - C.y), width/2, mouseY);

  text("Cos : " + round( 1000 * (C.x - A.x) / r) / 1000.0f, 0, 10);
  text("Sin : " + round( 1000 * (A.y - C.y) / r) / 1000.0f, 0, 20);
  text("Tan : " + round( 1000 *(A.y - C.y) / (C.x - A.y)) / 1000.0f, 0, 30);

  ellipse(width/2, height/2, r*2, r*2);
  
  text("Made by JDH..",width-80,height-6);
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Trigonometric" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
