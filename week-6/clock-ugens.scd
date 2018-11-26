// Clock UGens

// Impulse s a steady sample generator (equal time between impulses)
// It is non-bandlimited

(
{
	var sig;

	sig = Impulse.ar(MouseX.kr(0,100), mul: 0.5);
}.play;
)

// Blip is a bandlimited impulse generator

(
{
	var sig;

	sig = Blip.ar(MouseX.kr(0,100), numharm: MouseY.kr(0,2000), mul: 0.5);
}.play;
)

// Dust is a nimpulse generator that creates x-number of impulses per second between 0 and 1, that are not periodic

(
{
	var sig;

	sig = Dust.ar(MouseX.kr(0,100), mul: 0.5);

	Out.ar(0, sig!2);
}.play;
)

// Dust2 creates values between 0 and -1

(
{
	var sig;

	sig = Dust2.ar(MouseX.kr(0,100), mul: 0.5);

	Out.ar(0, sig!2);
}.play;
)


(
x = {
	var freq, sig;

	freq = LFNoise2.ar(10);

	freq = freq.range(40, 400);

	sig = SinOsc.ar(freq) * 0.5;
}.play;
)

x.free;