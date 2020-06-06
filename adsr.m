function env = adsr (A,D,S,R,level,fs,t,r,on)

%adsr a(attack), d(decay),s(sustain),r(release)
%fs= frec.muestreo
%t= duracion sonido (segundos)
%level (nivel sustain)
%A+D+S+R=1 (importante)

env=zeros(1,fs*t);

switch on
    case 1
switch r

    case 0;

A = linspace(0, 1, A*(fs*t));
D = linspace(1, level, D*(fs*t));
S = linspace(level, level, S*(fs*t)); 
R = linspace(level, 0, R*(fs*t)); %I then concatenate

    case 1
    
        
A = linspace(1, 0, A*(fs*t));
D = linspace(0, level, D*(fs*t));
S = linspace(level, level, S*(fs*t)); 
R = linspace(level, 0, R*(fs*t)); %I then concatenate
    
    case 2
    
        
A = linspace(1, 0, A*(fs*t));
D = linspace(0, level, D*(fs*t));
S = linspace(level, level, S*(fs*t)); 
R = linspace(level, 1, R*(fs*t)); %I then concatenate
end

    case 0
        env=ones(1,fs*t);
end

env([1:length([A D S R])]) = [A D S R] ;
end


 

