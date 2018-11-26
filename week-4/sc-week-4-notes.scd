// Look up 'Tour of UGens'

// UGens create smaple blocks that are then sent to the audio engine to be interpreted
// ar outputs a value for every sample within a sample block
// kr outputs a value once per sample block

(
a = {
	var freq, mod, carrFreq;
	carrFreq = LFNoise0(2).linlin.(-1,1,80,800);

	sig = SinOsc.ar()
}.play;
)


// LFNoise0 changes between frequencies instantly
// LFNoise1 changes between frequencies with a linear progression
// LFNoise2 changes between frequencies with an eased progression

(
{
	SinOsc.ar(20) * SinOsc.ar(1.8);
}.plot(2);
)