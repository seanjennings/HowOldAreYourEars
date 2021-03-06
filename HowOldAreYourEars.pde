import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import ddf.minim.ugens.*;


/*
Project Name: How Old are Your Ears?
Collaborators: Seán Jennings, Ciarán Ó Flatharta, Andrew McCormack
*/
int times, facts;
Visualizer visualizer;
boolean firstTime;
boolean started;
int displayFacts;
Minim minim;
Oscil wave;
PFont font;
PFont font2;
PImage splashBackground, stem, ditLogo, facts1, facts2;
AudioPlayer[] frequencies;

void setup()
{
  size(displayWidth, displayHeight);
  
  firstTime = true;
  displayFacts = 0;
  minim = new Minim(this);
  visualizer = new Visualizer();
  times = 1;
  facts = 1;
  started = false;
  
  frequencies = new AudioPlayer[9];
  frequencies[0] = minim.loadFile("17439khz.wav", 2048);
  frequencies[1] = minim.loadFile("17605khz.wav", 2048);
  frequencies[2] = minim.loadFile("17771khz.wav", 2048);
  frequencies[3] = minim.loadFile("17935khz.wav", 2048);
  frequencies[4] = minim.loadFile("18103khz.wav", 2048);
  frequencies[5] = minim.loadFile("18269khz.wav", 2048);
  frequencies[6] = minim.loadFile("18435khz.wav", 2048);
  frequencies[7] = minim.loadFile("18601khz.wav", 2048);
  frequencies[8] = minim.loadFile("18767khz.wav", 2048);
  
  font = createFont("SourceCodePro-Regular", (height / 32));
  font2 = createFont("Gulim-48", (height / 15));
  
  splashBackground = loadImage("HowOldAreYourEars.jpg");
  splashBackground.resize(width, height);
  stem = loadImage("STEM_Matters.jpg");
  stem.resize((width / 4), (height / 4));
  ditLogo = loadImage("DIT_logocol.jpg");
  ditLogo.resize((width / 4), (height / 3));
  facts1 = loadImage("end_slide_1.png");
  facts2 = loadImage("end_slide_2.png");
  /*
  AudioPlayer test;
  test = minim.loadFile("17439khz.mp3");
  test.play();*/
}

public void draw()
{ 
  if(!started)
  {
    background(255);
    stroke(0);
    fill(0);
    image(splashBackground, 0, 0);
    image(stem, 0, 0);
    image(ditLogo, (width - (width / 3.5f)), (height - (height / 2.7f)));
    textFont(font);
    text("Program created by DT228 Computer Science students:", (width / 1.9), height / 18);
    text("Andrew McCormack, Ciarán Ó Flatharta & Seán Jennings", (width / 1.9), height / 11);
    textFont(font2);
    text("Press enter to begin!", (width / 3), height - 20);
  }
  
  else if(displayFacts != 0)
  {
    visualizer.facts();
  }
  
  else
  {
    background(0);
    fill(255);
    stroke(0, 255, 0);
    textFont(font);
    visualizer.animation();
    visualizer.overlay();  
    
    if(!keyPressed)
    {
      firstTime = true;
    }
  }
}

void mouseClicked() {
  //visualizer.period -= 70;
  //setup();
}

public void keyPressed() {
  if(key == ENTER && !started)
  {
    times = 1;
    visualizer.playFrequency(times);
    started = true;
  }
    
  if (key == 'y' && firstTime == true && started)
  {
      visualizer.firstRun = true;
      if (times < frequencies.length)
      {
        times++;
      }
      else
      {
        times = 1;
      }
      visualizer.playFrequency(times);
    
    firstTime = false;
  }
  
  if(key == 'n' && started)
  {
    visualizer.displayAge = true;
  } 
  if(key == 'r' && started)
  {
    displayFacts = 0;
    visualizer.displayAge = false;
    times = 1;
    visualizer.playFrequency(times);
  }
  if(key == 'f' && started)
  {
    //disable previous frequency with mp3 implementation before displaying facts
    displayFacts = 1;
  }
  if(key == ENTER && started && ( displayFacts > 0 && displayFacts < 2 ) )
  {
    displayFacts++;
  }
  if(key == 'h' && started)
  {
    visualizer.displayControls = !visualizer.displayControls;
  }
}

public boolean sketchFullScreen() {
  return true;
}
