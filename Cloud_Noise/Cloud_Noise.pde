void setup(){
 size(400,400); 
}

float t1 = 0;
float t2 = 1000;
float blur = 0.01;
long seed = 1000;
void draw(){
  noiseSeed(seed);
  loadPixels();
  for (int x=0;x<width;x++){
    for (int y=0;y<height;y++){
       float bright = map(noise(x*blur + blur,y*blur + blur),0,1,0,255);
       pixels[x + y  * width] = color(bright);
    }
  }
  updatePixels();
}

void mouseMoved(){
 blur = dist(width/2,height/2,mouseX,mouseY)/10000; 
 seed += 1;
}
