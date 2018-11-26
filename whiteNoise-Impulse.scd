(
SynthDef(\noiseImpulse, {
	arg freq, amp = 0.25, atk = 0.01, dec = 0.1, sus = 0.7, rel = 1;
	var env, sig;

	env = EnvGen.ar(Env.adsr(attackTime: atk, decayTime: dec, sustainLevel: sus, releaseTime: rel, curve: -4),
		gate: Line.kr(1, 0, 1), doneAction: 2);

	freq = WhiteNoise.ar(amp);

	sig = freq * env;

	Out.ar(0, sig!2);
}).add;
)

(
Pdef(\noisePat,
	Pbind(
		\instrument, \noiseImpulse,
		\dur, Pseq([2], inf),
		\atk, Pxrand([1, 0.75, 0.5, 0.25, 0.1, 0.01, 0.001], inf)
	);
).play;
)