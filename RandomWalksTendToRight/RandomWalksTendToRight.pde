Walker w;

void setup(){
 size(300,300);
 w = new Walker();
 background(255); 
}

void draw(){
 w.display();
 w.step(); 
 
}
