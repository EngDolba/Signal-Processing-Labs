%% Filter Design and Audio Processing

% Define filter coefficients using given parameters
theta = -0.345;
b = conv([1 -exp(j*theta)],[1 -exp(j*-theta)]);
a = conv([1 -0.95*exp(j*theta)],[1 -0.95*exp(j*-theta)]);

% Read in audio file and filter using designed filter
[x,fs] = audioread('gala_sin.wav');
filtered_audio = filter(b,a,x);

% Play filtered audio
sound(filtered_audio,fs);

%% Note Detection

% Read in audio file
[x,fs] = audioread('Note09.wav');

% Detect maximum note frequency using custom function noteDetect()
[maxNote, maxNoteFreq] = noteDetect(x,fs);
