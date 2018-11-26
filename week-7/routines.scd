// Routine

a = Routine.new({1.yield; 2.yeild;});
a.dump;


(
Routine { arg inval;
	inval.postln;
}.value("hello routine");
)

(
r = Routine {
	199.yield;
	189.yield;
	200.idle(6);
	199.yield;
	189.yield;
};

fork {
	loop {
		r.value.postln;
		1.wait;
	}
}
)
