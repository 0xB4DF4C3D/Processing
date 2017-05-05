class CirMover extends Mover {

  CirMover(PVector _location, float _r, color _c, boolean outline) {
    super(_location, _r, _c, outline);
  }


  void CheckCirCollide(CirMover CM) {
    if (r/2 + CM.r/2 >PVector.dist(location, CM.location)) {
      ApplyForce(PVector.mult(PVector.sub(location, CM.location),0.001 * CM.m * PVector.dist(location, CM.location)));
    }
  } 
  //  
  void CheckBoxCollide(BoxMover BM) {
    fill(255,0,0);
    ellipse(BM.location.x, BM.location.y, 7, 7);
    ellipse(BM.location.x, BM.location.y + BM.r, 7, 7);
    
    stroke(2);
    line(location.x,location.y,BM.location.x, BM.location.y);
    PVector BM_Left = PVector.add(BM.location,new PVector());
    
    if (r  >PVector.dist(location, PVector.add(BM.location, new PVector(BM.r /2 , BM.r / 2)))) {
      ApplyForce(PVector.mult(PVector.sub(location, BM.location),0.001 * BM.m * PVector.dist(location, BM.location)));
      BM.ApplyForce(PVector.mult(PVector.sub(BM.location,location),0.001 * m * PVector.dist(location, BM.location)));
      
    }
    
    
    if(location.x < BM.location.x && location.y > BM.location.y && PVector.dist(location,BM.location) < r){ // left up
      ApplyForce(PVector.mult(PVector.sub(location, BM.location),0.001 * BM.m * PVector.dist(location, BM.location)));
      BM.ApplyForce(PVector.mult(PVector.sub(BM.location,location),0.001 * m * PVector.dist(location, BM.location)));
      text("!",100,100);
    }else if(location.x < BM.location.x && location.y > BM.location.y + BM.r && PVector.dist(location,BM_Left) < r){ // left down
      
       ApplyForce(PVector.mult(PVector.sub(location, BM.location),0.001 * BM.m * PVector.dist(location, BM.location)));
      BM.ApplyForce(PVector.mult(PVector.sub(BM.location,location),0.001 * m * PVector.dist(location, BM.location)));
      text("!",100,100);
    }
    
    
  }
  

  void display() {
    fill(c);
    ellipse(location.x, location.y, r, r);
  }
}

