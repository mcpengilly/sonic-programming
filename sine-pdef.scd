(
SynthDef(\sine, {
	arg freq, amp, atk, rel, pan;
	var sig, env;

	sig = SinOsc.ar(freq);
	env = EnvGen.kr(Env.new([0,1,0], [atk,rel], [1, -1]), doneAction: 2);

	sig = Pan2.ar(sig, pan, amp);

	sig = sig * env;

	Out.ar(0, sig);
}).add;
)


// change parameters during recording
(
Pdef(\sinepat,
	Pbind(
		\instrument, \sine,
		\midinote, Pseq([35], inf),
		\harmonic, Pexprand(1, 20, inf).round,
		\amp, Pkey(\harmonic).reciprocal * 0.3,
		\atk, Pwhite(2, 8, inf),
		\rel, Pwhite(5, 20, inf),
		\pan, Pwhite(-0.5, 0.5)
	);
).play
)

s.record;

s.stopRecording;