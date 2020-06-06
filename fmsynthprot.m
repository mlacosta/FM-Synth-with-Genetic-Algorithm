function synth_fm= fmsynth(f,time,ratio,I)

%sintetizador fm
%time=21408/44100;
f=rand(1)*1100
ratio=rand(1)*15
I=abs(rand(1)*40)


fs= 44100; %frecuencia de muestreo
l=fs*time; %cantidad de muestras
t=0:time/(fs*time):time;
t=t([1:(length(t)-1)]);%ajuste para que coincida con el env
fm=f*ratio;

%parametros ADSR aleatoreos
A=rand(1);
D=(1-A)*rand(1);
S=(1-A-D)*rand(1);
R=(1-A-D-S);

r=rand(1);

if r>0.5;%0.5 de prob. que se aplique la envolvente
f=f*adsr (A,D,S,R,rand(1),fs,time); %pitch envolvente
end

%parametros ADSR aleatoreos
A=rand(1);
D=(1-A)*rand(1);
S=(1-A-D)*rand(1);
R=(1-A-D-S);

r=rand(1);

if r>0.5;%0.5 de prob. que se aplique la envolvente
I=I*adsr (A,D,S,R,rand(1),fs,time); %cantidad de modulacion
end

synth_fm=sin(2.*pi.*f.*t+I.*sin(2*pi*t*fm)); %modulador A-->B (sinusoidales)



%parametros ADSR aleatoreos
A=rand(1);
D=(1-A)*rand(1);
S=(1-A-D)*rand(1);
R=(1-A-D-S);


r=rand(1);

if r>0.5; %0.5 de prob. que se aplique la envolvente
synth_fm=synth_fm.*adsr (A,D,S,R,rand(1),fs,time); %envolvente
end

synth_fm=synth_fm/max(synth_fm)*.5; %normalizacion para evitar distorcion

sound(synth_fm,fs);

figure(1)
plot(abs(fft(synth_fm)));
xlim([0 (length(synth_fm)/2)]);


 S = spectrogram(synth_fm,1024*8,1024*4,fs);
 
figure (2)
S=abs(S);
S=dincomp(S);
S=255-S;
S=imresize(S,[500 500]);

imshow(S);
%mesh(abs(S))

figure(3)

plot(synth_fm)