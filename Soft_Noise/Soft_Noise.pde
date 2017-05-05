
ArrayList<Walker> ws;



void setup() {
  size(640, 640);
  ws = new ArrayList<Walker>();
  ws.add(new Walker());
}

float t=3;
int time = 0;
void draw() {
  for (int i=ws.size ()-1; i >= 0; i--) {
    Walker w = ws.get(i);
    w.step();
    w.display();
    if(w.dead()) ws.remove(i);
  }

 if(time>10){
   ws.add(new Walker());
   time = 0;
 }else{
  time++; 
 }

}


