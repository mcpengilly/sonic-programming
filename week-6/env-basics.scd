// Envelopes wrap data in some sort of controlling thing

// starting with a basic sin example (no envolopes)

(
{
	var sig;

	sig = SinOsc.ar(200);

	Out.ar(0, [sig, sig]);

}.play;
)


// use a line UGen to linearly change amp

(
{
	var sig, env;

	env = Line.kr(start: 0, end: 1.0, dur: 4);

	sig = SinOsc.ar(200) * env;

	Out.ar(0, [sig, sig]);

}.play;
)

// opposite

(
{
	var sig, env;

	env = Line.kr(start: 1, end: 0, dur: 4);

	sig = SinOsc.ar(200) * env;

	Out.ar(0, [sig, sig]);

}.play;
)

// XLine (exponential line generator)

(
{
	var sig, env;

	env = XLine.kr(start: 2, end: 1, dur: 4, add: -1);

	sig = SinOsc.ar(200) * env;

	Out.ar(0, [sig, sig]);

}.play;
)

//both at the same time

(
{
	var sig, freq1, freq2;

	freq1 = XLine.kr(start: 400, end: 40, dur: 4);
	freq2 = Line.kr(start: 400, end: 40, dur: 4);



	sig = SinOsc.ar([freq1, freq2]) * 0.5;

	Out.ar(0, [sig]);

}.play;
)





// wwe can use envelopes to drive short time freamse as well
// look at Decay

// impulse without decay

(
{
	var sig;
	sig = Impulse.ar(MouseX.kr(0.01, 100)) * 0.7;
	Out.ar(0, sig!2);
}.play;
)

