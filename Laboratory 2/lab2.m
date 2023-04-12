
%% FIR Filter
warning('off');
% Part 1: Frequency response of a filter
% Define frequency range and transfer function
w = 0:0.01:pi;
H = @(w,th)1-2*cos(th)*exp(-j*w)+exp(-2*j*w);

% Plot frequency response for three different angles
subplot(3,1,1);
plot(w,abs(H(w,pi/6)))

subplot(3,1,2);
plot(w,abs(H(w,pi/3)))

subplot(3,1,3);
plot(w,abs(H(w,pi/2)))

close

% Part 2: Audio processing
% Load audio file and plot a portion of it
[x,fs] = audioread('gala_sin.wav');
time = 0:1/fs:10;
time = time(1:200);
plot(time,x(1:200));

% Calculate period and frequency response using DTFT
xStart = 0.00962;
xEnd = 0.011875;
period = 1/(xEnd-xStart);

[X,w] = DTFT(x,0);
plot(w,X);

% Find maximum frequency and filter audio
[X_max,I_max] = max(abs(X));
goodVoice = FIR_filt(x);
sound(goodVoice,fs);
%% IIR Filter
warning('off')
% Define transfer function and plot frequency response for different values of r
H1 = @(w,r)(1-r)./((1-r.*exp(1i*pi/3)*exp(-1i*w)).*(1-r.*exp(-pi/3*1i).*exp(-1i*w)));

subplot(3,1,1);
plot(w,abs(H1(w,0.99)))

subplot(3,1,2);
plot(w,abs(H1(w,0.9)))

subplot(3,1,3);
plot(w,abs(H1(w,0.7)))


% Part 2: IIR Filter
% Plot portion of PCM signal
load('pcm.mat');
plot(100:200,pcm(100:200));

% Calculate frequency response using DTFT and filter signal
[X,w] = DTFT(pcm,0);
subplot(2,1,1);
plot(w,X);
[X_max,I_max] = max(abs(X));
w(I_max);

goodVoice = IIR_filt(pcm);
sound(goodVoice,8000)

% Plot frequency response of filtered signal
[X1,w1] = DTFT(goodVoice,0);
subplot(2,1,2)
plot(w1,X1)
