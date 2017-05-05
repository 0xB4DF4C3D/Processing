class Walker {
 float x, y;
 float tx, ty;
 float life; 
 Walker(){
   life = 100;
   tx = random(50) ;
   ty = random(10000);
 }
 
 void step(){
 x = map(noise(tx),0,1,0,width);
 y = map(noise(ty),0,1,0,height);
 tx += 0.003;
 ty += 0.003;
 }
 
 void display(){
  fill(x/2.5,y/2.5,x*y/640,life);
  noStroke();
  ellipse(x,y,5,5); 
 }
 
 boolean dead(){
  life -= 1;
  if(life < 0) return true;
  else return false; 
 }
 
}
