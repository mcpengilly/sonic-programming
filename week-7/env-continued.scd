// Linear Evelopes

(
{
	var sig, env;
	env = Linen.kr(
		gate: MouseButton.kr(0,1,0),
		attackTime: 0.01,
		susLevel: 0.707,
		releaseTime: 0.25

	);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;
)


// more codified envelopes

// Important env types
// linen/triangle
// Perc (as in percussion)
// asr (attack, sustain, release)
// adsr (attack, decay, sustain, release)

// for all other evelopes we need a seperate UGen and evelope specification
// UGen -> EnvGen.ar/kr
// Specification comes from env class

(
{
	var sig, env;
	env = Env.perc(
		attackTime: 0.1,
		releaseTime: 0.5,
		level: 1,
		curve: -10
	);

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale: 0.707);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;
)

// Env.linen is very similar to Env.asr but Env.linen has a preset sustain time

(
{
	var sig, env;
	env = Env.linen(
		attackTime: 0.1,
		releaseTime: 0.5,
		level: 1,
		curve: -10
	);

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale: 0.707);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;
)

// Env.asr will sustain until the gate returns to 0

(
{
	var sig, env;
	env = Env.asr(
		attackTime: 0.1,
		releaseTime: 0.5,
		curve: -10
	);

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale: 0.707);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;
)

// Env.adsr

(
{
	var sig, env;
	env = Env.adsr(
		attackTime: 0.1,
		decayTime: 0.3,
		sustainLevel: 0.1,
		releaseTime: 0.5,
		peakLevel: 0.5,
		curve: 0
	);

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale: 0.707);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;
)

// Custom Envs

(
{
	var sig, env;
	env = Env.new(
		levels: [0,1, 0.7, 0.8, 0.1, 0.6, 0] + 1,
		times: [0.1, 1, 0.5, 0.5, 0.01],

		// curves can be uniform by using inputs such as \lin or \exp or can be unique by inputting numbers within an array
		curve: [4, -4, 0, 4, -4, 0],
		releaseNode: 5
	);

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale: 0.707);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;
)