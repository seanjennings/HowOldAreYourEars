class Visualizer
{
  int hertz;
  String averageAge;
  boolean canHear;
  float line1;
  boolean firstRun;
  boolean displayAge = false;
  
  Visualizer()
  {
    line1 = height / 2;
  }
  
  //Visualizer
  void animation()
  {/*
    for (int i = 0; i < in.bufferSize() - 1; i++)
    {
        line( i, line1 + in.left.get(i)*50, i+1, line1 + in.left.get(i+1)*50 );
    }*/
    for (int i = width/4; i < out.bufferSize() - 1; i++)
    {
      line( i, height/2 + out.left.get(i)*50, i+1, height/2 + out.left.get(i+1)*50 );
      //line( i, 150 + out.right.get(i)*50, i+1, 150 + out.right.get(i+1)*50 );
    }
    
    switch(times)
    {
      case 1:
        question(8000,"Everyone");
        break;
      case 2:
        question(12000,"Under 50");
        break;
      case 3:
        question(15000,"Under 40");
        break;
      case 4:
        question(16000,"Under 30");
        break;
      case 5:
        question(17000,"Under 24");
        break;
      case 6:
        question(18000,"Under 24");
        break;
      case 7:
        question(19000,"Under 20");
        break;
    }
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
  void question(int hertz, String age)
  {
    this.averageAge = age;
    textAlign(CENTER);
    textSize(width/16);
    stroke(255);
    text("Can you hear "+hertz+"Hz?", width/2, height/4);
    if(displayAge)
    {
      text(averageAge, width/2, (height/4)*3);
      textSize(width/32);
      text("Press R to reset.", width/2, (height*0.85));
    }
    
  }
}
