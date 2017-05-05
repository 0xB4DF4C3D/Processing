import controlP5.*;
ControlP5 cp5;


String target;
int lifeNum;
float mutationRate;
float startTime;
Population population;
HScrollbar frameRateBar;
boolean inputed = false;
boolean done = false;
String elapsedTime;


void setup() {
  size(800, 500); 
  lifeNum = 150;
  mutationRate = 0.01;
  frameRateBar = new HScrollbar(45, 190, 100, 16, 16);
  startTime = millis();

  PFont font = createFont("arial", 20);

  cp5 = new ControlP5(this);

  cp5.addTextfield("target")
    .setPosition(210, 445)
      .setSize(290, 40)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 190))
              .setColorBackground(color(0, 200))
                ;

  cp5.addBang("Enter")
    .setPosition(515, 440)
      .setSize(85, 45)
        .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
          ;

  cp5.addBang("Reset")
    .setPosition(370, 440)
      .setSize(85, 45)
        .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
          .setColor(color(255, 0, 0, 190));
  ;

  cp5.get(Bang.class, "Reset").hide().lock();
}

void draw() {
  background(255);
  textSize(20);
  fill(0);
  if (!inputed)
    text("Input Target DNA :", 20, 470);
  if (inputed == true) {

    if (!done) {
      population.naturalSelection();
      population.generate();
      population.calcFitness();
      frameRateBar.update();
      frameRateBar.display();
      fill(0);
    }
    if (population.fin() && !done) {
      done = true;
      elapsedTime = ": " + nfc((millis() - startTime) / 1000, 2) + "Sec"; //, 195, 480);
    }

    String answer = population.getBest();
    DNA BestDNA = population.getBestDNA();
    textSize(BestDNA.fitness * 30);
    text(answer, 150, 40);
    textSize(15);
    text("<All DNAs>", 580, 25);
    textSize(10);
    text(population.allDNAs(), 580, 40);

    if (population.fin() && done) {
      fill(255, 0, 0, 255);
      textSize(25);
      text("Elapsed Time ", 20, 480);
      text(elapsedTime, 195, 480);
      fill(0);
    }


    displayInfo();
  }
  
  
}

void displayInfo() {
  fill(0);
  textSize(25);

  text("Best DNA : ", 20, 40);

  textSize(20);
  text("Average Fitness", 20, 80);
  text(": " +  nf(population.getAverageFitness() * 100, 0, 2) + "%", 195, 80);
  text("Generation", 20, 110);
  text(": " + population.getGenerations() + "th", 195, 110);
  text("Total Population", 20, 140);
  text(": " + population.population.length, 195, 140);

  text("Evolution Speed", 20, 170);
  int evolutionSpeed = (int)map(frameRateBar.getPos(), 45, 128, 5, 100);
  text(": " + evolutionSpeed, 195, 170);
  frameRate(evolutionSpeed);

  text("Mutation Rate ", 20, 240);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    target = cp5.get(Textfield.class, "target").getText();
    if (target.length() > 25 || target.length() <= 0)
      cp5.get(Textfield.class, "target").setText("Range 1 ~ 25");
    else {
      inputed = true;
      done = false;
      population = new Population(target, mutationRate, lifeNum);
      cp5.get(Textfield.class, "target").hide().lock();
      cp5.get(Bang.class, "Enter").hide().lock();
      cp5.get(Bang.class, "Reset").show().unlock();
    }
  }
}

public void Enter() {
  target = cp5.get(Textfield.class, "target").getText();
  println(target);
  if (target.length() > 25 || target.length() <= 0)
    cp5.get(Textfield.class, "target").setText("Range 1 ~ 25");
  else {
    inputed = true;
    done = false;
    population = new Population(target, mutationRate, lifeNum);
    cp5.get(Textfield.class, "target").hide().lock();
    cp5.get(Bang.class, "Enter").hide().lock();
    cp5.get(Bang.class, "Reset").show().unlock();
  }
}

public void Reset() {

  cp5.get(Bang.class, "Reset").hide().lock();
  cp5.get(Bang.class, "Enter").show().unlock().setCaptionLabel("!!");
  cp5.get(Textfield.class, "target").show().unlock();
                 
  inputed = false;
}

