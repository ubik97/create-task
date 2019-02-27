
SinOsc a2 => JCRev rev => Pan2 pan => dac;
0 => int i;
   0.005 => a2.gain;
0 => int counter;
[ 0, 2, 4, 7, 9] @=> int arr[];

//while (counter<=100) {
//440/3 => a.freq;
//0.2::second=>now;
//440/2 => a.freq;
//0.2::second=>now;
//440/4 => a.freq;
//0.2::second=>now;
//counter++;
//}
    
while (true) {
   Math.mtof(60+arr[i%5])=>a2.freq; 
   0.25::second=>now;
   i++;
}




 //392.63 => a2.freq;
    //0.5::second=>now;
   // 392.63/1.5 => a2.freq;
    //0.5::second=>now;
   // 392.63/2 => a2.freq;
   // 0.25::second=>now;