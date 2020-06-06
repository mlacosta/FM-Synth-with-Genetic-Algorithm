function OUT = fmsynth (env,enva,envb,envc,envap,fm, EST, Ia, Ib, Ic, Idfm, Ra, Rb, Rc, Rd,osca, oscb, oscc, oscd, inta, intb, intc,l,t,fs,fcorte,Qfac,filt_on)


%-------------------------------------------------------------------------
%Modulación de los I
Ia=enva.*Ia;
Ib=envb.*Ib;
Ic=envc.*Ic;

%-------------------------------------------------------------------------

%-------------------------------------------------------------------------
%Estructuras FM

switch EST
    
    case 1

%Estructura I


switch osca
    case 1
        A=sin(2*pi*t.*fm*Ra); %osc A
    case 2
        A=square(2*pi*t.*fm*Ra); %osc A
    case 3
         A=sawtooth(2*pi*t.*fm*Ra,.5); %osc A
    case 4
         A=sawtooth(2*pi*t.*fm*Ra); %osc A
end


switch oscb
    case 1
        
       B=sin(2*pi*t.*fm*Rb+Ia.*A*inta); %osc B
    case 2
        B=square(2*pi*t.*fm*Rb+Ia.*A*inta); %osc B
    case 3
        B=sawtooth(2*pi*t.*fm*Rb+Ia.*A*inta,.5); %osc B
    case 4
    B=sawtooth(2*pi*t.*fm*Rb+Ia.*A*inta); %osc B
end

switch oscc
    case 1
        C=sin(2*pi*t*fm*Rc+Ib.*B*intb); %osc B
    case 2
        C=square(2*pi*t*fm*Rc+Ib.*B*intb); %osc B
    case 3
        C=sawtooth(2*pi*t*fm*Rc+Ib.*B*intb,.5); %osc B
    case 4
        C=sawtooth(2*pi*t*fm*Rc+Ib.*B*intb); %osc B
  
end

switch oscd
    case 1
        D=sin(2*pi*t*fm.*envap*Rd+Ic.*C*intc); %osc B
    case 2
        D=square(2*pi*t*fm.*envap*Rd+Ic.*C*intc); %osc B
    case 3
        D=sawtooth(2*pi*t*fm.*envap*Rd+Ic.*C*intc,.5); %osc B
    case 4
        D=sawtooth(2*pi*t*fm.*envap*Rd+Ic.*C*intc,.5); %osc B
   
end


OUT=D;

case 2

%Estructura II

%Parámetros de los OSC

Ia1=Ia; %indice de modulacion osc A-B

Ia2=Ib; %indice de modulacion osc A-C

Ia3=Ic; %indice de modulacion osc A-D

switch osca
    case 1
A=sin(2*pi*t*fm.*Ra); %osc A
    case 2
        A=square(2*pi*t*fm.*Ra); %osc A
    case 3
         A=sawtooth(2*pi*t*fm.*Ra,.5); %osc A
    case 4
        A=sawtooth(2*pi*t*fm.*Ra); %osc A
end

switch oscb
    case 1
B=sin(2*pi*t.*envap.*fm.*Rb+Ia1.*A*inta); %osc B
    case 2
        B=square(2*pi*t.*envap.*fm.*Rb+Ia1.*A*inta); %osc B
    case 3
        B=sawtooth(2*pi*t.*envap.*fm.*Rb+Ia1.*A*inta,.5); %osc B
    case 4
        B=sawtooth(2*pi*t.*envap.*fm.*Rb+Ia1.*A*inta); %osc B
end

switch oscc
    case 1
C=sin(2*pi*t.*envap.*fm*Rc+Ia2.*A*inta); %osc B
    case 2
        C=square(2*pi*t.*envap.*fm*Rc+Ia2.*A*inta); %osc B
    case 3
        C=sawtooth(2*pi*t.*envap.*fm*Rc+Ia2.*A*inta,.5); %osc B
    case 4
        C=sawtooth(2*pi*t.*envap.*fm*Rc+Ia2.*A*inta); %osc B
end

switch oscd
    case 1
D=sin(2*pi*t.*envap.*fm*Rd+Ia3.*A*inta); %osc B
    case 2
     D=square(2*pi*t.*envap.*fm*Rd+Ia3.*A*inta); %osc B   
    case 3
        D=sawtooth(2*pi*t.*envap.*fm*Rd+Ia3.*A*inta,.5); %osc B   
    case 4
    D=sawtooth(2*pi*t.*envap.*fm*Rd+Ia3.*A*inta); %osc B   
end

OUT=B*intb+C*intc+D;

case 3


%Estructura III

switch osca
    case 1

A=Ia.*sin(2*pi*t.*fm*Ra); %osc A
    case 2
        A=Ia.*square(2*pi*t.*fm*Ra); %osc A
    case 3
        A=Ia.*sawtooth(2*pi*t.*fm*Ra,.5); %osc A
    case 4
        A=Ia.*sawtooth(2*pi*t.*fm*Ra); %osc A
end

switch oscb
    case 1

B=Ib.*sin(2*pi*t.*fm*Rb);%osc B
    case 2
        B=Ib.*square(2*pi*t.*fm*Rb);%osc B
    case 3
        B=Ib.*sawtooth(2*pi*t.*fm*Rb,.5);%osc B
    case 4
        B=Ib.*sawtooth(2*pi*t.*fm*Rb);%osc B
end

sum= A*inta+B*intb;

switch oscc
    case 1
C=sin(2*pi*t.*fm*Rc+sum); %osc B
    case 2
        C=square(2*pi*t.*fm*Rc+sum); %osc B
    case 3
        C=sawtooth(2*pi*t.*fm*Rc+sum,.5); %osc B
    case 4
        C=sawtooth(2*pi*t.*fm*Rc+sum); %osc B
end

switch oscd
    case 1
D=sin(2*pi*t.*envap.*fm*Rd+Ic.*C*intc); %osc B
    case 2
        D=square(2*pi*t.*envap.*fm*Rd+Ic.*C*intc); %osc B
    case 3
        D=sawtooth(2*pi*t.*envap.*fm*Rd+Ic.*C*intc,.5); %osc B
    case 4
        D=sawtooth(2*pi*t.*envap.*fm*Rd+Ic.*C*intc); %osc B
end
OUT=D;

case 4

%Estructura IV
%Parámetros de los OSC

Ia1=Ia; %indice de modulacion osc A

Ia2=Ib; %indice de modulacion osc B

switch osca
    case 1
A=sin(2*pi*t.*fm.*Ra); %osc A
    case 2
        A=square(2*pi*t.*fm.*Ra); %osc A
    case 3
        A=sawtooth(2*pi*t.*fm.*Ra,.5); %osc A
    case 4
        A=sawtooth(2*pi*t.*fm.*Ra); %osc A
end

switch oscb
    case 1
B=sin(2*pi*t.*fm.*Rb+Ia1.*A*inta); %osc B
    case 2
B=square(2*pi*t.*fm.*Rb+Ia1.*A*inta); %osc B
    case 3
B=sawtooth(2*pi*t.*fm.*Rb+Ia1.*A*inta,.5); %osc B
    case 4
B=sawtooth(2*pi*t.*fm.*Rb+Ia1.*A*inta); %osc B
end

switch oscc
    case 1
C=sin(2*pi*t.*fm*Rc+Ia2.*A*inta); %osc C
    case 2
        C=square(2*pi*t.*fm*Rc+Ia2.*A*inta); %osc C
    case 3
        C=sawtooth(2*pi*t.*fm*Rc+Ia2.*A*inta,.5); %osc C
    case 4
        C=sawtooth(2*pi*t.*fm*Rc+Ia2.*A*inta); %osc C
end


sum= C*intc+B*intb;

switch oscd
    case 1
D=sin(2*pi*t.*envap.*fm*Rd+Ic.*sum); %osc B
    case 2
        D=square(2*pi*t.*envap.*fm*Rd+Ic.*sum); %osc B
    case 3
        D=sawtooth(2*pi*t.*envap.*fm*Rd+Ic.*sum,.5); %osc B
    case 4
        D=sawtooth(2*pi*t.*envap.*fm*Rd+Ic.*sum); %osc B
end

OUT=D;

case 5


%Estructura V
%Parámetros de los OSC

Ia1=Ia; %indice de modulacion osc A

Ia2=Ic; %indice de modulacion osc C

switch osca
    case 1
A=sin(2*pi*t.*fm*Ra); %osc A
    case 2
A=square(2*pi*t.*fm*Ra); %osc A
    case 3
A=sawtooth(2*pi*t.*fm*Ra,.5); %osc A
    case 4
A=sawtooth(2*pi*t.*fm*Ra); %osc A
end

switch oscb
    case 1
B=sin(2*pi*t.*fm*Rb); %osc B
    case 2
B=square(2*pi*t.*fm*Rb); %osc B
    case 3
B=sawtooth(2*pi*t.*fm*Rb,.5); %osc B
    case 4
B=sawtooth(2*pi*t.*fm*Rb); %osc B
end

switch oscc
    case 1
C=sin(2*pi*t.*envap.*fm*Rc+Ia2.*A*inta); %osc C
    case 2
C=square(2*pi*t.*envap.*fm*Rc+Ia2.*A*inta); %osc C
    case 3
C=sawtooth(2*pi*t.*envap.*fm*Rc+Ia2.*A*inta,.5); %osc C
    case 4
C=sawtooth(2*pi*t.*envap.*fm*Rc+Ia2.*A*inta); %osc C
end


sum1= Ia1.*A*inta+B.*Ib*intb;

switch oscd
    case 1
D=sin(2*pi*t.*envap.*fm*Rd+sum1); %osc D
    case 2
D=square(2*pi*t.*envap.*fm*Rd+sum1); %osc D
    case 3
D=sawtooth(2*pi*t.*envap.*fm*Rd+sum1,.5); %osc D
    case 4
D=sawtooth(2*pi*t.*envap.*fm*Rd+sum1); %osc D
end

OUT=D+C*intc;

case 6


%Estructura VI (DFM)
%Parámetros de los OSC

Ia1=Ia; %indice de modulacion osc A
Ra1=Ra; %Radio del osc A
Ib1=Ib; %indice de modulacion osc B
Rb1=Rb; %Radio del osc B
Ia2=Ic; %indice de modulacion osc C
Ra2=Rc; %Radio del osc C
Ib2=Idfm; %extra
Rb2=Rd; %Radio del osc D


A1=sin(2*pi*t.*envap.*fm*Ra1); %osc A

B1=sin(2*pi*t.*envap.*fm*Rb1); %osc B

A2=sin(2*pi*t.*envap.*fm*Ra2); %osc A

B2=sin(2*pi*t.*envap.*fm*Rb2); %osc B

C=sin(Ia1.*A1+Ib1.*B1); %osc C

D=sin(Ia2.*A2+Ib2.*B2); %osc D

OUT=C+D;

end

%------------------------------------------------------------------------

OUT=env.*OUT;


%------------------------------------------------------------------------
%filtrado

if filt_on ==1
    
    OUT = moogfilt (fs,OUT,fcorte,Qfac);
     
end




%-------------------------------------------------------------------------
OUT=OUT/max(OUT)*.5; %normalizacion para evitar distorcion

%figure (1)
%plot(abs(fft(OUT)));
%xlim([0 (length(OUT)/2)]);

%sound(OUT,fs);

%figure(2),plot(OUT);

%S = spectrogram(OUT,1024*8,1024*4,fs);
 
%figure (2)
%S=abs(S);
%S=dincomp(S);
%S=255-S;
%S=imresize(S,[500 500]);

%imshow(S);
end