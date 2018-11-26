(
SynthDef(\randInst, {

	arg freq = 440, amp = 0.1, maxDel = 0.1, coef = 0.1;
	var sig, env;

	//env = EnvGen.kr(Env.linen(attackTime: 0.001, sustainTime: 5, releaseTime: 0), doneAction: 2);

	sig = if(LFNoise0.kr(1.0, 0.5, 0.5) , SinOsc.ar(freq) * EnvGen.ar(Env.perc(0.001, Rand(2.5, 3.5), 0.1, -8), doneAction: 2),
		Pluck.ar(
		in: WhiteNoise.ar(amp),
		trig: Impulse.kr(0),
		maxdelaytime: maxDel,
		delaytime: freq.reciprocal,
		decaytime: 5,
		coef: coef
	));


	sig = Pan2.ar(sig, 0);

	Out.ar(0, sig);
}).add;
)


(
Pdef(\randInstPat,
	Pbind(
		\instrument, \randInst,
		\scale, Scale.hungarianMinor,
		// \degree, Pwrand([0, 1, 2, 3, 4, 5, 6, 7], [0.2, 0.2, 0.1, 0.1, 0.2, 0.1, 0.1], inf),
		\degree, Pxrand([0, 1, 2, 3, 4, 5, 6, 7], inf),
		\dur, Pwrand([1, 0.5, 0.25, 0.125], [0.1, 0.3, 0.2, 0.4], inf),
		// \dur, Pseq([1, 1, 1, 1, 0.5, 0.5, 1, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25], inf),
		// \maxDel, Pseq([1], inf),
		// \dec, Pwhite(3, 8, inf),
		\amp, Pseq([0.05], inf)
	);
).play;
)


