function [OUT,S,genoma] = interprete(genoma,time,fs,target)
    %Par?metros Globales

    %fs= frecuencia de muestreo
    %time= duracion en segundos
    l=fs*time; %cantidad de muestras
    t=0:time/(fs*time):time;
    t=t([1:(length(t)-1)]);%ajuste para que coincida con el env

    %lectura del genoma

    [supra infra]=size(genoma);

    for index2=1:supra

        for index=1:(infra-1)

            switch index
                case 1
                    on=genoma(index2,index);
                case 2
                    Ai=genoma(index2,index);
                case 3
                    Di=genoma(index2,index);
                case 4
                    Si=genoma(index2,index);
                case 5
                    level=genoma(index2,index);
                case 6
                    r=genoma(index2,index);
                case 7
                    ona=genoma(index2,index);
                case 8
                    Aai=genoma(index2,index);
                case 9
                    Dai=genoma(index2,index);
                case 10
                    Sai=genoma(index2,index);
                case 11
                    levela=genoma(index2,index);
                case 12
                    ra=genoma(index2,index);
                case 13
                    onb=genoma(index2,index);
                case 14
                    Abi=genoma(index2,index);
                case 15
                    Dbi=genoma(index2,index);
                case 16
                    Sbi=genoma(index2,index);
                case 17
                    levelb=genoma(index2,index);
                case 18
                    rb=genoma(index2,index);
                case 19
                    onc=genoma(index2,index);
                case 20
                    Aci=genoma(index2,index);
                case 21
                    Dci=genoma(index2,index);
                case 22
                    Sci=genoma(index2,index);
                case 23
                    levelc=genoma(index2,index);
                case 24
                    rc=genoma(index2,index);
                case 25
                    onp=genoma(index2,index);
                case 26
                    Api=genoma(index2,index);
                case 27
                    Dpi=genoma(index2,index);
                case 28
                    Spi=genoma(index2,index);
                case 29
                    levelp=genoma(index2,index);
                case 30
                    rp=genoma(index2,index);
                case 31
                    pam=genoma(index2,index);
                case 32
                    fm=genoma(index2,index);
                case 33
                    EST=genoma(index2,index);
                case 34
                    Ia=genoma(index2,index);
                case 35
                    Ib=genoma(index2,index);
                case 36
                    Ic=genoma(index2,index);
                case 37
                    Idfm=genoma(index2,index);
                case 38
                    Ra=genoma(index2,index); 
                case 39
                    Rb=genoma(index2,index);    
                case 40
                    Rc=genoma(index2,index);   
                case 41
                    Rd=genoma(index2,index);
                case 42
                    Radtype=genoma(index2,index);
                case 43
                    Rai=genoma(index2,index); 
                case 44
                    Rbi=genoma(index2,index);    
                case 45
                    Rci=genoma(index2,index);   
                case 46
                    Rdi=genoma(index2,index);
                case 47
                    osca=genoma(index2,index);
                case 48
                    oscb=genoma(index2,index);
                case 49
                    oscc=genoma(index2,index);
                case 50
                    oscd=genoma(index2,index);
                case 51
                    inta=genoma(index2,index);
                case 52
                    intb=genoma(index2,index);
                case 53
                    intc=genoma(index2,index);
                case 54
                    filt_on=genoma(index2,index);
                case 55
                    fcorte=genoma(index2,index);
                case 56
                    Qfac=genoma(index2,index);
                case 57
                    onf=genoma(index2,index);  
                case 58
                    Afi=genoma(index2,index);
                case 59
                    Dfi=genoma(index2,index);
                case 60
                    Sfi=genoma(index2,index);
                case 61
                    levelf=genoma(index2,index);
                case 62
                    rf=genoma(index2,index);
                case 63
                    onq=genoma(index2,index);
                case 64
                    Aqi=genoma(index2,index);
                case 65
                    Dqi=genoma(index2,index);
                case 66
                    Sqi=genoma(index2,index);
                case 67
                    levelq=genoma(index2,index);
                case 68
                    rq=genoma(index2,index);
            end

    end
    %parametros ADSR aleatoreos
    A=Ai; %envolvente final
    D=(1-A)*Di;
    S=(1-A-D)*Si;
    R=(1-A-D-S);

    env=adsr (A,D,S,R,level,fs,time,r,on);

    Aa=Aai; % env osca
    Da=(1-Aa)*Dai;
    Sa=(1-Aa-Da)*Sai;
    Ra=(1-Aa-Da-Sa);

    enva=adsr (Aa,Da,Sa,Ra,levela,fs,time,ra,ona);

    Ab=Abi; % env oscb
    Db=(1-Ab)*Dbi;
    Sb=(1-Ab-Db)*Sbi;
    Rb=(1-Ab-Db-Sb);

    envb=adsr (Ab,Db,Sb,Rb,levelb,fs,time,rb,onb);

    Ac=Aci; % env oscc
    Dc=(1-Ac)*Dci;
    Sc=(1-Ac-Dc)*Sci;
    Rc=(1-Ac-Dc-Sc);
    envc=adsr (Ac,Dc,Sc,Rc,levelc,fs,time,rc,onc);

    %envolventes del pitch
    Ap=Api; % env osca
    Dp=(1-Ap)*Dpi;
    Sp=(1-Ap-Dp)*Spi;
    Rp=(1-Ap-Dp-Sp);
    levelp=rand(1);

    envap=adsr_pitch (Ap,Dp,Sp,Rp,levelp,fs,time,rp,onp,pam);

    if Radtype==1

    Ra=Rai; %Radio del osc A
    Rb=Rbi; %Radio del osc B
    Rc=Rci; %Radio del osc C
    Rd=Rdi;
    end

    %modulacion frecuencia de corte
    Af=Afi; % env osca
    Df=(1-Af)*Dfi;
    Sf=(1-Af-Df)*Sfi;
    Rf=(1-Af-Df-Sf);
    levelp=rand(1);

    %envfreq=adsr (Af,Df,Sf,Rf,levelf,fs,time,rf,onf,paf); 
    envfreq=adsr (Af,Df,Sf,Rf,levelf,fs,time,rf,onf); 

    Aq=Aqi; %envolvente final
    Dq=(1-Aq)*Dqi;
    Sq=(1-Aq-Dq)*Sqi;
    Rq=(1-Aq-Dq-Sq);

    envQ=adsr (Aq,Dq,Sq,Rq,levelq,fs,time,rq,onq); 

    fcorte=fcorte*envfreq; %Parametro a ingresar
    Qfac=Qfac*envQ; %Parametro a ingresar

    %modulacion Q


    OUT = fmsynth (env,enva,envb,envc,envap,fm, EST, Ia, Ib, Ic, Idfm, Ra, Rb, Rc, Rd,osca, oscb, oscc, oscd, inta, intb, intc,l,t,fs,fcorte,Qfac,filt_on);


    S = spectrogram(OUT,1024*8,6144,1024*8,fs); %espectrograma del sonido generado, con un tama?o de 8196 muestras y 75%  de solapamiento;

    S= abs(S); %espectro de amplitud.

    genoma(index2,69)=fitness(S,target); %calcula el fitness de cada individuo


    end
end