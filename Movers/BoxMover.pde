class BoxMover extends Mover {
  BoxMover(PVector _location, float _r, color _c, boolean outline) {
    super(_location, _r, _c, outline);
  }


  void CheckBoxCollide(BoxMover BM) {
    if(location.x + r > BM.location.x && location.x < BM.location.x + BM.r && location.y + r > BM.location.y && location.y < BM.location.y + BM.r){
    vel.mult(0.1);
    BM.vel.mult(0.1);
    ApplyForce(PVector.mult(PVector.sub(location, BM.location), 0.002 * PVector.dist(location, BM.location)));
    }
   }
  

  
  
  void CheckEdge(int w, int h,float damp){
    if(location.x + r > w){
      vel.x *= -damp;
      location.x = w - r;
    }else if(location.x < 0){
      vel.x *= -damp;
      location.x = 0;
    }else if(location.y + r > h){
      vel.y *= -damp;
      location.y = h - r;
    }else if(location.y < 0){
      vel.y *= -damp;
      location.y = 0;
    }
  }void display() {
    fill(c);
    rect(location.x, location.y, r, r);
  }
}

