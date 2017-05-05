class Mover {
  PVector location;
  PVector vel;
  PVector acc;
  float r;
  float m;
  color c;
  
  Mover(PVector _location,float _r,color _c,boolean outline){
    location = _location.get();
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    r = _r;
    m = _r*0.1;
    c = _c;
    if(!outline) noStroke();
  }
  
  void ApplyForce(PVector vec){
    acc.add(PVector.div(vec,m));
  }
  
  void CheckEdge(int w, int h,float damp){
    if(location.x + r/2 > w){
      vel.x *= -damp;
      location.x = w - r/2;
    }else if(location.x - r/2 < 0){
      vel.x *= -damp;
      location.x = r/2;
    }else if(location.y + r/2 > h){
      vel.y *= -damp;
      location.y = h - r/2;
    }else if(location.y - r/2 < 0){
      vel.y *= -damp;
      location.y = r/2;
    }
  }
   
  void update(){
   vel.add(acc);
   acc.mult(0);
   location.add(vel); 
   vel.mult(0.99);
  }

  void display(){
   fill(c);
  }
  
  
  
}


