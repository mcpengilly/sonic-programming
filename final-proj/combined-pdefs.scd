(
SynthDef(\pluck, {
	arg freq = 440, amp = 0.1, atk = 0, rel = 0, maxDel = 0.1, dec = 5, coef = 0.1, out = 0;
	var sig, env;

	env = EnvGen.kr(Env.linen(attackTime: atk, sustainTime: dec, releaseTime: rel), doneAction: 2);
	sig = Pluck.ar(
		in: WhiteNoise.ar(amp),
		trig: Impulse.kr(0),
		maxdelaytime: maxDel,
		delaytime: freq.reciprocal,
		decaytime: dec,
		coef: coef
	);

	sig = Pan2.ar(sig, 0);

	Out.ar(out, sig);
}).add;
)

Synth(\pluck);

~bus = Bus.audio(s, 2);


(
Pdef(\pluckPat,
	Pbind(
		\instrument, \pluck,
		\scale, Scale.hungarianMinor,
		// \degree, Pxrand([[0, 2, 4] [3, 7, 11], [4, 7, 9], [4, 9, 11], [5, 9, 11]], inf),
		\degree, Pxrand([0, 1, 2, 3, 4, 5, 6, 7], inf),
		// \dur, Pseq([1, 1, 0.25, 0.25, 0.5, 2], inf),
		\dur, Pseq([1], inf),
		\maxDel, Pseq([1], inf),
		\dec, Pwhite(3, 8, inf),
		\amp, Pseq([0.05], inf),
		\out, ~bus
	);
)
)

Pdef(\pluckPat).play;

(
SynthDef(\out, {
	arg in = 0, out = 0;
	var sig, inSig;

	inSig = In.ar(in, 2);

	sig = inSig;

	// sig = FreeVerb.ar(inSig, 0.1, 0.5, 0.5);

	Out.ar(0, sig);
}).add;
)

Synth(\out, [\in, ~bus]);