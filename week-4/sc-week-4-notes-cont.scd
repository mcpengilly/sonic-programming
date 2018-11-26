// Additive and Subtractive Synthesis

(
{
	arg baseFreq = 200;
	var sig1, sig2, sig3, sig4, outSig;

	sig1 = SinOsc.ar(baseFreq, mul: 0.25);
	sig2 = SinOsc.ar(baseFreq * 2, mul: 0.25);
	sig3 = SinOsc.ar(baseFreq * 3, mul: 0.25);
	sig4 = SinOsc.ar(baseFreq * 4, mul: 0.25);

	//the Mix Ugen mixes all specified signals into one
	outSig = Mix([sig1,sig2,sig3,sig4]);

	Out.ar(0, outSig);
}.play;
)