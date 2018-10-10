(
x = SynthDef(\sawSynth, {
	arg freq, atk, rel, out = 0, lofreq = 1500, hifreq = 2000;
	var sig, env;

	env = Env.perc(
		atk,
		rel,
		level: 0.25,
		curve: -4
	).kr(doneAction: 2);

/*	env = EnvGen.kr(env, 1, doneAction: 2);*/

	sig = Saw.ar(freq: freq * [0.99, 1.0, 1.001], mul: env);

	sig = LPF.ar(
		in: sig,
		freq: LFNoise2.kr(1).range(lofreq, hifreq);

		Out.ar(0, sig!2);
	);
}).add;
)

x = Synth(\sawSynth, [\freq, 440, \atk, 0.01, \rel, 2]);