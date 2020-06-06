A=rand(1)
D=(1-A)*rand(1)
S=(1-A-D)*rand(1)
R=(1-A-D-S)
level=rand(1)
fs=48000;
t=1;

env=zeros(1,fs*t);

A = linspace(1, 0, A*(fs*t));
D = linspace(0, level, D*(fs*t));
S = linspace(level, level, S*(fs*t)); 
R = linspace(level, 0, R*(fs*t)); %I then concatenate

env([1:length([A D S R])]) = [A D S R] ;

l=length(env)
 
plot(env)