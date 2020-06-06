%Moog ladder filter de 4to orden (24dB/Octava) con conpensación de ganancia

fs=44100; %frec. muestreo
x=OUT; %archivo de audio
l=length(x); %cantidad de muestras
fc=linspace(0,1,length(OUT))*10000; %vector con las frecuencias instantaneas de corte
%Q; %vector con los factores de calidad instantaneos.
x=OUT; %archivo de audio
k=ones(size(OUT))*3;%vector de ganancia k=4 oscila

%-------------------------------------------------------------------------
wd=2*pi*fc; %frecuencia digital
T=1/fs; %periodo de muestreo
wa=(2/T)*tan(wd*T/2); %frecuencia digital prewarpeada
g=wa*T/2;
G=g./(1+g);
a=.05;



for i=1:l
    
    if i==1
        u(i)=x(i)*(1+a*k(i))/(1+k(i)*G(i)^2);
        
        
    else
        s1=y1(i-1)+v1(i-1);
        s2=y2(i-1)+v2(i-1);
        s3=y3(i-1)+v3(i-1);
        s4=y4(i-1)+v4(i-1);
        
        sum=s4+G(i)*s3+G(i)^2*s2+G(i)^3*s1;
        
        
  u(i)=(x(i)*(1+a*k(i))-k(i)*sum)/(1+k(i)*G(i)^2);
        
        
    end
    
    %filtro I pasabajos de primer orden
    
    if i==1
    v1(i)=G(i)*u(i);
    
    y1(i)= v1(i);
    
    else
    v1(i)=G(i)*(u(i)-v1(i-1)-y1(i-1));
    
    y1(i)= v1(i)+v1(i-1)+y1(i-1);
    end

    
%filtro II pasabajos de primer orden
    
    if i==1
    v2(i)=G(i)*y1(i);
    
    y2(i)= v2(i);
    
    else
    v2(i)=G(i)*(y1(i)-v2(i-1)-y2(i-1));
    
    y2(i)= v2(i)+v2(i-1)+y2(i-1);
    end
    
    %filtro III pasabajos de primer orden

    
    if i==1
    v3(i)=G(i)*y2(i);
    
    y3(i)= v3(i);
    
    else
    v3(i)=G(i)*(y2(i)-v3(i-1)-y3(i-1));
    
    y3(i)= v3(i)+v3(i-1)+y3(i-1);
    end
    
   %filtro IV pasabajos de primer orden

    
    if i==1
    v4(i)=G(i)*y3(i);
    
    y4(i)= v4(i);
    
    else
    v4(i)=G(i)*(y3(i)-v4(i-1)-y4(i-1));
    
    y4(i)= v4(i)+v4(i-1)+y4(i-1);
    end
    
end
    

