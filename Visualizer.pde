class Visualizer
{
  int hertz;
  String averageAge;
  boolean canHear;
  float line1;
  boolean firstRun;
  boolean displayAge = false;
  boolean displayControls = false;
  int quaterSize;
  
  Visualizer()
  {
    line1 = height / 2;
    quaterSize = (width / 4);
  }
  
  //Visualizer
  void animation()
  {
    fractalDraw();
    stroke(0, 155, 155);
    for (int i = quaterSize; i < out.bufferSize() - quaterSize; i+= 4)
    {
      line( i, height/2 + out.left.get(i)*800, i+1, height/2 + out.left.get(i+1)*800 );
    }
    
    switch(times)
    {
      case 1:
        question(8000,"Every human can hear this!");
        break;
      case 2:
        question(12000,"Over 50");
        break;
      case 3:
        question(15000,"Over 40");
        break;
      case 4:
        question(16000,"Over 30");
        break;
      case 5:
        question(17000,"Over 24");
        break;
      case 6:
        question(18000,"Over 24");
        break;
      case 7:
        question(19000,"Over 20");
        break;
    }
    
    controls();
  }
  
  void controls()
  {
    pushStyle();
    
    textAlign(LEFT);
    noStroke();
    
    if(displayControls)
    {
      fill(255, 255, 255, 100);
      rect(0,height - height/10,width*.60,height);
      fill(255);
      
      textSize(height/40);
      text("Help: H",width/200, height - height/40);
      textSize(height/20);
      text("Yes: Y",width/10, height - height/40);
      text("No: N",width/10 * 2, height - height/40);
      text("Reset: R",width/10 * 4, height - height/40);
    }
    else
    {
      textSize(height/40);
      fill(255);
      text("Help: H",width/200, height - height/40);
    }
    
    popStyle();
    
  }
  
  void overlay()
  {
    pushStyle();
    
    popStyle();
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
          wave = new Oscil( 8000, 0.06f, Waves.SINE );
          // patch the Oscil to the output
          wave.patch( out );

        break;
        case 2:
        if (wave!=null&&out!=null)
          wave.unpatch(out);
          //wave.unpatch(out);
          // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
          wave = new Oscil( 12000, 0.06f, Waves.SINE );
          // patch the Oscil to the output
          wave.patch( out );
        break;
        
        case 3:
        if (wave!=null&&out!=null)
          wave.unpatch(out);
          //wave.unpatch(out);
          // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
          wave = new Oscil( 15000, 0.06f, Waves.SINE );
          // patch the Oscil to the output
          wave.patch( out );
        break;
        
        case 4:
        if (wave!=null&&out!=null)
          wave.unpatch(out);
          //wave.unpatch(out);
          // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
          wave = new Oscil( 16000, 0.06f, Waves.SINE );
          // patch the Oscil to the output
          wave.patch( out );
        break;
        
        case 5:
        if (wave!=null&&out!=null)
          wave.unpatch(out);
          //wave.unpatch(out);
          // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
          wave = new Oscil( 17000, 0.06f, Waves.SINE );
          // patch the Oscil to the output
          wave.patch( out );
        break;
        
        case 6:
        if (wave!=null&&out!=null)
          wave.unpatch(out);
          //wave.unpatch(out);
          // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
          wave = new Oscil( 18000, 0.06f, Waves.SINE );
          // patch the Oscil to the output
          wave.patch( out );
        break;
        
        case 7:
        if (wave!=null&&out!=null)
          wave.unpatch(out);
          //wave.unpatch(out);
          // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
          wave = new Oscil( 19000, 0.06f, Waves.SINE );
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
      text("Press F for hearing facts.", width/2, (height*0.95));
    }
  }
  
  void facts()
  {
    pushStyle();
    textAlign(LEFT);
    fill(0);
    textSize(width/40);
    
    background(255);
    switch(displayFacts)
    {
      case 1:
      {
        facts1.resize(width, height);
        image(facts1, 0, 0);
        text("Press ENTER to continue", 10, height/15);
        break;
      }
      
      case 2:
      {
        facts2.resize(width, height);
        image(facts2, 0, 0);
        text("Press R to reset", 10, height/15);
        break;
      }
    }
    
    popStyle();
  }
  
  int nBranches = 6;
  float startingLength = 290;
  float phasor = 0.0;
  float rate = 0.0005;
  color bg = color(0, 8);
   
  PVector getVCoordinates(PVector v, float d, float a) {
    return new PVector(v.x + d * cos(a), v.y + d * sin(a));
  }
  
  void fractalDraw() 
  {
    pushStyle();
    smooth();
    strokeWeight(5);
    fill(bg);
    noStroke();
    rect(0, 0, width, height);
   
    float sine = sin(phasor * TWO_PI);
    float angle = map(sine, -1.0, 1.0, -HALF_PI, HALF_PI);
    float divPoint = map(sine, -1.0, 1.0, 1.0, 0.5);
     
    for (int i = 0; i < nBranches; i++) {
      float L = startingLength;
      float a = TWO_PI / (float) nBranches * (float) i;
      PVector v1 = new PVector(width / 2, height / 2);
      PVector v2 = getVCoordinates(v1, L, a);
       
      while (L > 2) {
        stroke(0, 0, 255, 32);
        L *= 0.95;
         
        line(v1.x, v1.y, v2.x, v2.y);
        a += angle;
       
        v1.x = lerp(v1.x, v2.x, divPoint);
        v1.y = lerp(v1.y, v2.y, divPoint);
         
        v2 = getVCoordinates(v1, L, a);
      }
    }
   
    phasor += rate;
    if (phasor >= 1.0) {
      phasor -= 1.0;
    }
    popStyle();
  }
}
