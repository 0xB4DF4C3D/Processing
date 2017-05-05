
ArrayList<Mover> Ms;

void setup() {
  size(500, 500);
  textSize(30);
  Ms = new ArrayList<Mover>();
  //CirMover(originX,originY,radius,color,outline?)
  // Ms.add(new CirMover(new PVector(width/2, height/2), random(10,30), color(random(255), random(255), random(255), random(100, 255)), true));
  // Ms.add(new BoxMover(new PVector(width/2, height/2), random(10,30), color(random(255), random(255), random(255), random(100, 255)), true));
}

void draw() {
  background(200);



  for (int i=Ms.size ()-1; i>=0; i--) {

    Mover AM = Ms.get(i);
    AM.ApplyForce(new PVector(0, 0.4));
    AM.CheckEdge(width, height, 0.8);
    AM.update();
    AM.display();
    
    
    PVector angle = PVector.sub(new PVector(mouseX, mouseY), AM.location);
    angle.normalize();
    
    float dist = PVector.dist(new PVector(mouseX, mouseY), AM.location);
    if(dist < 200){
    dist = constrain(dist * 0.07, 6, 200);
    angle.mult(26 / ( dist * dist ));
    AM.ApplyForce(angle);
    
    if(Ms.get(i) instanceof BoxMover)
    PVector.add(AM.location,new PVector(AM.r /2, AM.r /2));
    
    if(PVector.dist(new PVector(mouseX, mouseY), AM.location) < 200){
    stroke(2);
    line(mouseX,mouseY,AM.location.x, AM.location.y);
    }
    }
  }

  for (int i=Ms.size ()-1; i>=0; i--) {
    for (int j=Ms.size ()-1; j>=0; j--) {
      if (i != j) {
        if (Ms.get(i) instanceof CirMover && Ms.get(j) instanceof CirMover) {
          CirMover CM = (CirMover) Ms.get(i);
          CirMover CM2 = (CirMover) Ms.get(j);
          CM.CheckCirCollide(CM2);
        } else if (Ms.get(i) instanceof BoxMover && Ms.get(j) instanceof BoxMover) {
          BoxMover BM = (BoxMover) Ms.get(i);
          BoxMover BM2 = (BoxMover) Ms.get(j);
          BM.CheckBoxCollide(BM2);
        } else if (Ms.get(i) instanceof CirMover && Ms.get(j) instanceof BoxMover) {

          CirMover CM = (CirMover) Ms.get(i);
          BoxMover BM = (BoxMover) Ms.get(j);
          CM.CheckBoxCollide(BM);
        }
      }
    }
  }
}


void mousePressed() {
  if (mouseButton == 37)
    Ms.add(new CirMover(new PVector(mouseX, mouseY), random(20, 50), color(random(255), random(255), random(255), random(100, 255)), true));
  else if (mouseButton == 39)
    Ms.add(new BoxMover(new PVector(mouseX, mouseY), random(20, 50), color(random(255), random(255), random(255), random(100, 255)), true));
}


void keyPressed() {
  if (keyCode == ' ') 
    for (int i=Ms.size ()-1; i>=0; i--) {
      Mover CM = Ms.get(i);
      CM.vel.mult(0.7);
      CM.acc.mult(0.7);
    }
}

