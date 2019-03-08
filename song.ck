


  2::second => dur half;
  2*half => dur whole;
  
  fun void melody() {
      TriOsc melody => dac;
      220 => melody.freq;
      0.005 => melody.gain;
      half=>now;
      196 => melody.freq;
      half=>now;
      174.61=> melody.freq;
      whole =>now;
          
 }


  fun void loop(){ 
   SinOsc a2 => JCRev rev => dac;
    0 => int i;
    0.005 => a2.gain;
    0 => int counter;
    [ 0, 2, 4, 7, 9, 16, 12, 11, 4, 2, 7] @=> int arr[];
    
    while (i<=100) {
        Math.mtof(60+arr[i%11])=>a2.freq; 
        0.25::second=>now;
        i++;
    }  
}

spork ~ loop();
spork ~ melody();
4*whole=>now;

half => now;

spork ~ loop();
spork ~ melody();
4*whole=>now;




