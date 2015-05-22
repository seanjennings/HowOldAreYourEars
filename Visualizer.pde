class Visualizer
{
  int hertz;
  int averageAge;
  boolean canHear;
  float line1;
  boolean firstRun;
  
  Visualizer()
  {
    line1 = height / 2;
  }
  
  //Visualizer
  void animation()
  {
    for (int i = 0; i < in.bufferSize() - 1; i++)
    {
        line( i, line1 + in.left.get(i)*50, i+1, line1 + in.left.get(i+1)*50 );
    }
  //  for (int i = 0; i < out.bufferSize() - 1; i++)
    //{
     // line( i, 50 + out.left.get(i)*50, i+1, 50 + out.left.get(i+1)*50 );
     // line( i, 150 + out.right.get(i)*50, i+1, 150 + out.right.get(i+1)*50 );
   // }
  }
  
  // wave = new Oscil... etc.
  void playFrequency(int times)
  {
    //wave.reset();
    
      switch(times) 
      {
      
        case 1:
        if (wave!=null&&out!=null)
        
          wave.unpatch(out);
          //wave.unpatch(out);
          // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
          wave = new Oscil( 8000, 0.5f, Waves.SINE );
          // patch the Oscil to the output
          wave.patch( out );

        break;
        case 2:
        if (wave!=null&&out!=null)
          wave.unpatch(out);
          //wave.unpatch(out);
          // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
          wave = new Oscil( 12000, 0.5f, Waves.SINE );
          // patch the Oscil to the output
          wave.patch( out );
        break;
        
        case 3:
        if (wave!=null&&out!=null)
          wave.unpatch(out);
          //wave.unpatch(out);
          // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
          wave = new Oscil( 15000, 0.5f, Waves.SINE );
          // patch the Oscil to the output
          wave.patch( out );
        break;
        
        case 4:
        if (wave!=null&&out!=null)
          wave.unpatch(out);
          //wave.unpatch(out);
          // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
          wave = new Oscil( 16000, 0.5f, Waves.SINE );
          // patch the Oscil to the output
          wave.patch( out );
        break;
        
        case 5:
        if (wave!=null&&out!=null)
          wave.unpatch(out);
          //wave.unpatch(out);
          // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
          wave = new Oscil( 17000, 0.5f, Waves.SINE );
          // patch the Oscil to the output
          wave.patch( out );
        break;
        
        case 6:
        if (wave!=null&&out!=null)
          wave.unpatch(out);
          //wave.unpatch(out);
          // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
          wave = new Oscil( 18000, 0.5f, Waves.SINE );
          // patch the Oscil to the output
          wave.patch( out );
        break;
        
        case 7:
        if (wave!=null&&out!=null)
          wave.unpatch(out);
          //wave.unpatch(out);
          // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
          wave = new Oscil( 19000, 0.5f, Waves.SINE );
          // patch the Oscil to the output
          wave.patch( out );
        break;
  }    
  
}
  
  //Ask person if they can hear frequency, display average age, continue to next visualizer if true
  void question()
  {
  }
}
