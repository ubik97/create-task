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
   SinOsc a2 => JCRev rev => Pan2 pan => dac;
    0 => int i;
    0.005 => a2.gain;
    0 => int counter;
    [ 0, 2, 4, 7, 9, 16, 12, 11, 4, 2, 7] @=> int arr[];
    
    while (i<100) {
        Math.mtof(60+arr[i%11])=>a2.freq; 
        Math.random2f(-1.0,1.0) => pan.pan;
        0.25::second=>now;
        i++;
    }  
}

fun void panloop() {

    
}

spork ~ loop();
spork ~ melody();
2*whole=>now;

spork ~ melody();
2*whole=>now;




