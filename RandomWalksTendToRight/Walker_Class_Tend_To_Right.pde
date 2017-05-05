class Walker {
  int x;
  int y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void display() {
    fill(0);
    ellipse(x, y,2,2);
  }

  void step() {
    float stepx = (random(5)) - 1;
    float stepy = (random(3)) - 1;

    x += stepx;
    y += stepy;
  }
}

