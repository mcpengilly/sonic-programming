(
SynthDef(\pluck, {
	arg freq = 440, amp = 0.1, atk = 0, rel = 0, maxDel = 0.1, dec = 5, coef = 0.1;
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

	Out.ar(0, sig);
}).add;
)

(
Pdef(\pluckPat,
	Pbind(
		\instrument, \pluck,
		\scale, Scale.hungarianMinor,
		\degree, Pxrand([[0, 2, 5] [2, 5, 7], [4, 7, 9], [4, 9, 11], [5, 9, 11]], inf),
		\dur, Pseq([0.5], inf),
		\maxDel, Pseq([1], inf),
		\dec, Pwhite(3, 8, inf),
		\amp, Pseq([0.05], inf)
	);
).play;
)