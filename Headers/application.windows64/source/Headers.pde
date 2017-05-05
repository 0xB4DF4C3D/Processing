PVector origin;
PVector location;
ArrayList<Header>  Headers;

void setup() {
  size(400,400);
  smooth(); 
  mouseX = width/2;
  mouseY = height/2;
  strokeWeight(2);
  Headers = new ArrayList<Header>();
 
for(int x=0; x<width;x+=20){
for(int y=0; y<height;y+=20){
  Headers.add(new Header(x,y,3));
}
}

}

void draw() {
  
  background(200);
  for(Header h : Headers){
   h.display(); 
  }
}

class Header {
  PVector origin;
  PVector location;
  float l;


  Header(int x, int y, float _l) {

    origin = new PVector(x, y);
    location = new PVector();
    l = _l;
  }

  void display() {
    
    location.set(mouseX, mouseY);
    location.sub(origin);
    location.limit(10);
    location.add(origin);
    
    stroke(0,3000/dist(origin.x,origin.y,mouseX,mouseY));
    
    line(origin.x, origin.y, location.x, location.y);
  }
}

