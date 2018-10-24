// interview buffers

~i1 = Buffer.read(s, "/Volumes/3TB\ Mick\'s\ Hard\ Drive/College/Semester\ 7/Experimental\ Film/Interview/audio/exp-int-aud-1.aif");

~i2 = Buffer.read(s, "/Volumes/3TB Mick's Hard Drive/College/Semester 7/Experimental Film/Interview/audio/exp-int-aud-2.aif");

~i3 = Buffer.read(s, "/Volumes/3TB Mick's Hard Drive/College/Semester 7/Experimental Film/Interview/audio/exp-int-aud-3.aif");

~i4 = Buffer.read(s, "/Volumes/3TB Mick's Hard Drive/College/Semester 7/Experimental Film/Interview/audio/exp-int-aud-4.aif");

~i5 = Buffer.read(s, "/Volumes/3TB Mick's Hard Drive/College/Semester 7/Experimental Film/Interview/audio/exp-int-aud-5.aif");

~i1.play;
~i2.play;
~i3.play;
~i4.play;
~i5.play;


// music recording buffers

~t1 = Buffer.read(s, "/Users/mickpengilly/Documents/College/Semester 7/sonic-programming/project-1/trombone-1.aif");

~t2 = Buffer.read(s, "/Users/mickpengilly/Documents/College/Semester 7/sonic-programming/project-1/trombone-2.aif");

~t3 = Buffer.read(s, "/Users/mickpengilly/Documents/College/Semester 7/sonic-programming/project-1/trombone-3.aif");

~t1.play;
~t2.play;
~t3.play;




// feedback for interview audio

(
SynthDef(\feedbackDelay_Internal, {
	arg micIn = 0;
	var sig, inSig, fbSig;

	inSig = SoundIn.ar(micIn);

	fbSig = LocalIn.ar(1);

	sig = Mix([inSig, fbSig]);

	sig = inSig;

	sig = DelayC.ar(sig, 2, 2);

	// multiply sig in order to specify decay time
	LocalOut.ar(sig * 0.3);

	sig = LPF.ar(sig, 1000);

	Out.ar(0, sig!2);
}).add;
)

Synth(\feedbackDelay_Internal);


// synthdef that makes the trombone sound wacky
(
x = SynthDef(\tromboneBuf, {
	arg out = 0, bufnum, length, freq;
	var sig;

	sig = PlayBuf.ar(
		numChannels: 2,
		bufnum: bufnum,
		rate:BufRateScale.kr(bufnum) * LFNoise2.kr(1, 0.8, 1.2),
		trigger: 1.0,
		startPos: 0,
		loop: 1.0,
		doneAction: 0
	);

	freq = SinOsc.ar(Vibrato.ar(DC.ar(400.0),LFNoise2.kr(1,3,7)));

	sig = sig * freq;

	sig = sig * 0.25;

	Out.ar(out, sig!2);
}).add;
)

x = Synth(\tromboneBuf, [\bufnum, ~t3]);
x.free;

s.record;
s.stopRecording;