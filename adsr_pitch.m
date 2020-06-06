function env = adsr_pitch (A,D,S,R,level,fs,t,r,on,pam)

%adsr a(attack), d(decay),s(sustain),r(release)
%fs= frec.muestreo
%t= duracion sonido (segundos)
%level (nivel sustain)
%A+D+S+R=1 (importante)


env=zeros(1,fs*t);

a=pam/100;
b=(100-pam)/100;

switch on
    case 1
switch r

    case 0;

A = linspace(b, a, A*(fs*t));
D = linspace(a, level, D*(fs*t));
S = linspace(level, level, S*(fs*t)); 
R = linspace(level, b, R*(fs*t)); %I then concatenate

    case 1
    
        
A = linspace(a, b, A*(fs*t));
D = linspace(b, level, D*(fs*t));
S = linspace(level, level, S*(fs*t)); 
R = linspace(level, b, R*(fs*t)); %I then concatenate
    
    case 2
    
        
A = linspace(a, b, A*(fs*t));
D = linspace(b, level, D*(fs*t));
S = linspace(level, level, S*(fs*t)); 
R = linspace(level, a, R*(fs*t)); %I then concatenate
end

    case 0
        env=ones(1,fs*t);
end

env([1:length([A D S R])]) = [A D S R] ;
env=env*1.5+.5;
end


 

