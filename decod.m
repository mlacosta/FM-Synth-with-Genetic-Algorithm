function [target,time] = decod (sonido,fs)

time=length(sonido)/fs;
sonido=sonido/max(sonido)*.5; %normalizacion
target=abs( spectrogram(sonido,1024*8,6144,1024*8,fs) );
