import controlP5.*;

ControlP5 cp5;

String textValue = "";
int i = 10;
boolean inputed;

void setup(){
  PFont font = createFont("arial",20);
  size(700,400);
  
  cp5 = new ControlP5(this); 
  
  cp5.addTextfield("input")
   .setPosition(20,100)
   .setSize(200,40)
   .setFocus(true)
   .setFont(font)
   .setColor(color(255,190))
   ;
   
  cp5.addBang("printf")
     .setPosition(240,170)
     .setSize(80,40)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
     ;    
  textSize(40);
}

void draw(){
  if(inputed){
  cp5.get(Textfield.class,"input").setText(str(i));
  if(i<0){
  cp5.get(Textfield.class,"input").setText("End");
  inputed = false;
  }
  i--;
  }
  
}

public void printf(){
  
   i = int(cp5.get(Textfield.class,"input").getText());
   inputed = true;
}
