Walker w;

void setup(){
 size(300,300);
 w = new Walker();
 background(255); 
}

void draw(){
 w.display();
 w.step(); 

 
 fill(255,10);
 stroke(0);
 ellipse(w.x,w.y,8,8);
 
}
