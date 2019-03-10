  2::second => dur half;
 2*half => dur whole;
 half/2 => dur quarter;
 
 
  fun void melody() {
      SinOsc melody => Chorus blah => dac;
      220*2 => melody.freq;
      0.1 => melody.gain;
      half => now;
      196*2 => melody.freq;
      half => now;
      174.61*2 => melody.freq;
      whole =>now;
          
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







