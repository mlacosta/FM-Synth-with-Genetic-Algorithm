
clear all
clc
fs=44100;
fm=523.25; %frec.nota
tam_torn=7; %tama?o del torneo
kill_size=10; %tama?o kill tournament
pm=0.05; %prob. de mutacion
sound=audioread('SOUND_03_523.25.wav');

sound=stmon(sound)'; %stereo a mono

cant_gen=1000; %cantidad de generaciones
cant_indiv=25; %cantidad de individuos

[target,time] = decod (sound,fs);
genoma=generador(cant_indiv,fm);
[OUT,S,genoma] = interprete(genoma,time,fs,target); %solo se utiliza genoma
%genoma=control(genoma);

for i=1:cant_gen
    hijos = genetico (genoma,tam_torn,pm,fm);
    [OUT,S,hijos] = interprete(hijos,time,fs,target); %calcula el fitness de los hijos
    %genoma=control(genoma);

    %genoma= reemplazar(genoma, hijos);
    genoma = kill(genoma, hijos,kill_size);
    vaule(i)=min(genoma(:,69));
    plot(vaule)
    pause(.1)
    media(i)=mean(genoma(:,69));
end

toc