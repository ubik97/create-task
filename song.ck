 2::second => dur half;
 2*half => dur whole;
 half/2 => dur quarter;
 float fundfreq;
 float upfreq;
 float downfreq;
 
 
 
  fun void melody() {
      SinOsc fund => dac;
      SinOsc down => dac;
      SinOsc up => dac;
      
      220*2 => fundfreq; 
      
      chorusModule(fundfreq, upfreq, downfreq);
      //make one module to tune up and another to tune down
      //chuck the functions to the freq variables so that
      //the function returns properly
      
      upfreq => up.freq;
      fundfreq => fund.freq;
      downfreq => down.freq;
      
      0.1 => up.gain;
      0.1 => fund.gain;
      0.1 => down.gain;
      <<< fundfreq >>>;
      <<< upfreq >>>;
      <<< downfreq >>>;
      
      half => now; 
      
      
          
 }
 
 fun float chorusModule(float fundfreq, float upfreq, float downfreq) {
     fundfreq + 5.0 => upfreq;
     fundfreq - 5.0 => downfreq;
     return fundfreq;
     return upfreq;
     return downfreq;
     
 }


  fun void loop(){ 
    SinOsc a2 => JCRev rev => Pan2 panvar => dac;
    0 => int i;
    0 => float x;
    0.1 => a2.gain;
    [ 0, 2, 4, 7, 9, 16, 12, 11, 4, 2, 7] @=> int melodyArr[];
    
    while (i<100) {
        Math.mtof(60+melodyArr[i%11]) => a2.freq; 
        
        
        if (x<1.0) {
           x + 0.1 => x;
           x => panvar.pan;
      } 
      
      else {
          -1 => x;
    }
        0.25::second=>now;
        i++;    
  }
}  



spork ~ loop();
spork ~ melody();
2*whole=>now;

spork ~ melody();
2*whole=>now;

spork ~ melody();
2*whole=>now;

spork ~ melody();
spork ~ loop();
2*whole=>now;

