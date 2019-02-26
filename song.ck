SinOsc a => NRev rev => dac;
TriOsc a2;
440 => a.freq;
0.01 => a.gain;



0 => int counter;

[ 2, 4, 5, 7, 9] @=> int arr[];

while (counter<=100) {
440/3 => a.freq;
0.2::second=>now;
440/2 => a.freq;
0.2::second=>now;
440/4 => a.freq;
0.2::second=>now;
counter++;
    
if (counter%2==0) {
    TriOsc a2 => dac;
    0.01 => a2.gain;
    392.63 => a2.freq;
    1::second=>now;
}

}
