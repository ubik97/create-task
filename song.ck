SinOsc a2 => JCRev rev => Pan2 pan => dac;
0 => int i;
0.005 => a2.gain;
0 => int counter;
[ 0, 2, 4, 7, 9, 16, 12, 11, 4, 2, 7] @=> int arr[];



    
while (true) {
   Math.mtof(60+arr[i%11])=>a2.freq; 
   0.25::second=>now;
   i++;
    

  
 }




