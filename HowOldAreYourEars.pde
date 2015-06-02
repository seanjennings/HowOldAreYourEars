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
int sampleRate = 44100;
int times;
Visualizer visualizer;
boolean firstTime;
boolean started;
Minim minim;
AudioOutput out;
Oscil wave;
PFont font;
PFont font2;
PImage splashBackground, stem, ditLogo;

void setup()
{
  size(displayWidth, displayHeight);
  
  firstTime = true;
  minim = new Minim(this);
  //use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut(Minim.MONO, width, sampleRate, 16);
  visualizer = new Visualizer();
  times = 1;
  started = false;
  
  font = createFont("SourceCodePro-Regular", (height / 32));
  font2 = createFont("Gulim-48", (height / 15));
  
  splashBackground = loadImage("HowOldAreYourEars.jpg");
  splashBackground.resize(width, height);
  stem = loadImage("STEM_Matters.jpg");
  stem.resize((width / 4), (height / 4));
  ditLogo = loadImage("DIT_logocol.jpg");
  ditLogo.resize((width / 4), (height / 3));
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
    text("Program created by DT228 Computer Science students:", (width / 1.8), height / 18);
    text("Andrew McCormack, Ciarán Ó Flatharta & Seán Jennings", (width / 1.8), height / 12);
    textFont(font2);
    text("Press enter to begin!", (width / 3), height - 20);
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

public void keyPressed() {
  if(key == ENTER && !started)
  {
    times = 1;
    visualizer.playFrequency(times);
    started = true;
  }
    
  if (key == 'y' && firstTime == true && started)
  {
    if (wave!=null&&out!=null)
    {
      wave.unpatch(out);
      visualizer.firstRun = true;
      if (times <= 6)
      {
        times++;
      }
      else
      {
        times = 1;
      }
      visualizer.playFrequency(times);
    }
    firstTime = false;
  }
  
  if(key == 'n' && started)
  {
    visualizer.displayAge = true;
  } 
  if(key == 'r' && started)
  {
    visualizer.displayAge = false;
    times = 1;
    visualizer.playFrequency(times);
  }
  if(key == 'h' && started)
  {
    visualizer.displayControls = !visualizer.displayControls;
  }
}

public boolean sketchFullScreen() {
  return true;
}
