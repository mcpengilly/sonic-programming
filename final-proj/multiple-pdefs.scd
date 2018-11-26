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
SynthDef(\iter, {
	arg freq, atk, dec, rel, amp = 0.005;
	var temp, sum, env;

	sum = 0;

	env = EnvGen.kr(Env.adsr(atk, dec, 0.7, rel, curve: -4),
		doneAction: 2
	);

	10.do({
		temp = VarSaw.ar(freq * {Rand(0.99, 1.01)}!2,
			{Rand(0.0, 1.0)}!2,
			{ExpRand(0.005, 0.5)}!2
		);

		sum = sum + temp;
	});

	sum = sum * env;

	sum = sum * amp;

	Out.ar(0, sum);
}).add;
)

(
SynthDef.new(\kick, {arg out = 0, amp = 1, sinfreq = 60, glissf = 0.4, atk = 0.01, rel = 0.5, pan = 0;
	var env, snd, ramp;
	env = Env.perc(atk, rel, amp).kr(doneAction: 2);
	ramp = XLine.kr(
		start: sinfreq,
		end: sinfreq * glissf,
		dur: rel
	);
	snd = SinOsc.ar(freq: ramp, mul: env);
	snd = Pan2.ar(snd, pan);
	Out.ar(out, snd);
}).add;
)

(
Pdef(\iterPat,
	Pbind(
		\instrument, \iter,
		\scale, Scale.hungarianMinor,
		\degree, Pxrand([0, 1, 2, 3, 4, 5, 6, 7] - 15, inf),
		\dur, Pseq([5], inf),
		\atk, Pwhite(5, 10, inf),
		\dec, Pwhite(0.3, 0.5, inf),
		\rel, Pwhite(2, 16, inf),
		\amp, Pwhite(0.005, 0.01, inf)
	);
).play;
)


(
Pdef(\pluckPat,
	Pbind(
		\instrument, \pluck,
		\scale, Scale.hungarianMinor,
		// \degree, Pxrand([[0, 2, 5], [2, 5, 7]], inf),
		\degree, Pxrand([0, 1, 2, 3, 4, 5, 6, 7], inf),
		\dur, Pwrand([1, 0.5, 0.25], [0.1, 0.5, 0.4], inf),
		// \dur, Pseq([1, 1, 1, 1, 0.5, 0.5, 1, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25], inf),
		\maxDel, Pseq([1], inf),
		\dec, Pwhite(3, 8, inf),
		\amp, Pseq([0.05], inf)
	);
).play;
)



(
Pdef(\kickPat,
	Pbind(
		\instrument, \kick,
		\dur, Pseq([1], inf),
		\sinfreq, Pseq([40], inf),
		\glissf, Pseq([0.6], inf),
		\rel, Pseq([0.8], inf),
		\amp, Pseq([1.2], inf)
	);
).play;
)
