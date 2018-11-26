// What happens to a synth after the envelope finishes?

(
{
	var sig, env;

	env = Env.linen(
		attackTime: 0.01,
		sustainTime: 0.5,
		releaseTime: 0.5,
		curve: 0
	);

	env = EnvGen.kr(env, gate: 1, levelScale: 0.5, doneAction: 2);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;
)