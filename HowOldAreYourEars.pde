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
  Minim       minim;
AudioOutput out;
AudioInput in;
Oscil       wave;

void setup()
{
  size(displayWidth, displayHeight);
  firstTime = true;
  background(0);
  minim = new Minim(this);
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
  in = minim.getLineIn(Minim.MONO, width, sampleRate, 16);
  visualizer = new Visualizer();
  times = 1;
  visualizer.playFrequency(times);

}

void draw()
{
  background(0);
  stroke(0, 255, 0);
  visualizer.animation();
   
  if(!keyPressed)
  {
    firstTime = true;
  }
}

void keyPressed() {
  if (key == ' ' && firstTime == true)
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
  
  if(key == 'y')
  {
    times++;
  }
  if(key == 'n')
  {
    visualizer.displayAge = true;
  }
  if(key == 'r')
  {
    visualizer.displayAge = false;
    times = 1;
  }
}
/*
//Full screen default code
boolean sketchFullScreen() {
  return true;
}*/
