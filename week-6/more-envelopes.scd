// Envelopes Revisited

(
{
	var sig, noteEnv;

	noteEnv = Env.new(
		[60,60,0,0,60,60,0,0,67,67,0,0,67,67, 0, 0, 69, 69, 0, 0, 69, 69, 0, 0, 67,67, 0, 0],
		[3, 0 ,1 ,0 , 3, 0, 1, 0, 3, 0 ,1, 0, 3, 0, 1, 0, 3, 0, 1, 0, 3, 0, 1, 0, 3, 0] * 0.15
	);

	noteEnv = EnvGen.kr(noteEnv);

	sig = SinOsc.ar(noteEnv.midicps, mul: 0.7);

	Out.ar(0, sig!2);

}.play;
)

(
x = {
	arg gateVal = 1;
	var sig, env;

	env = Env.new(
		[0, 1, 0.3, 0.7, 0],
		[0.3, 0.01, 0.5, 2],
		curve: [4, -4, 4, -4],
		releaseNode: 2
	);

	env = EnvGen.kr(env, gate: gateVal);

	sig = LFTri.ar( 60.midicps, mul: env * 0.5);

	Out.ar(0, sig!2);
}.play;
)

x.set(\gateVal, 0);
