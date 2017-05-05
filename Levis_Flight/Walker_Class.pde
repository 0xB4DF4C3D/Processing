class Walker {
  int x;
  int y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void display() {
    noStroke();
    fill(100);
    ellipse(x,y,3,3);
  }
  
  void step() {
    float stepx = (random(3)) - 1;
    float stepy = (random(3)) - 1;
    x += stepx;
    y += stepy;
    
    if(random(1) < 0.01){
     x += random(-100,100);
     y += random(-100,100); 
    }
    
  }
}

