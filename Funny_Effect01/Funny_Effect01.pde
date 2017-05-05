void setup(){
 size(300,300); 
 noStroke();
}

void draw(){
 fill(random(255),random(255),random(255),random(255));
 for(int i=0;i<10;i++){
  int r = int(random((dist(mouseX,mouseY,width/2,height/2))/5));
  ellipse(mouseX + random(mouseX-width/2)/2,mouseY + random(mouseY-height/2)/2, r, r);
 }

 fill(180,20);
 rect(0,0,width,height);
}
