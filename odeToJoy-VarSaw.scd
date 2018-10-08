(
x = SynthDef(\iter, {
	arg freq;
	var temp, sum, env;

	sum = 0;

	env = EnvGen.kr(Env.perc(0.01, 0.5, 1, -4),
		doneAction: 2
	);

	10.do({
		temp = VarSaw.ar(freq * {Rand(0.99, 1.00)}!2,
			{Rand(0.0, 1.0)}!2,
			{ExpRand(0.005, 0.5)}!2
		);

		sum = sum + temp;
	});

	sum = sum * 0.01;

	Out.ar(0, sum);
}).add;
)

(
p = Pbind(
	\instrument, \iter,
	\dur, Pseq([0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.75, 0.25, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.75, 0.25, 1], 1),
	\midinote, Pseq([64, 64, 65, 67, 67, 65, 64, 62, 60, 60, 62, 64, 64, 62, 62, 64, 64, 65, 67, 67, 65, 64, 62, 60, 60, 62, 64, 62, 60, 60], 1)
).play;
)