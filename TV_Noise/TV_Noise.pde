void setup(){
 size(400,400); 
}

float t1 = 0;
float t2 = 1000;

void draw(){
  loadPixels();
  for (int x=0;x<width;x++){
    for (int y=0;y<height;y++){
     float bright = random(255);
       pixels[x + y  * width] = color(bright);
    }
  }
  updatePixels();
}
