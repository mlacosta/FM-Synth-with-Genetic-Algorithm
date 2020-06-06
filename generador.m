function genoma = generador (poblacion,fm);
%generador del genoma

genoma=zeros(poblacion,69);

    for index=1:poblacion
    %parametros ADSR aleatoreos
        on=randi(2,1)-1;
        Ai=rand(1); %envolvente final
        Di=rand(1);
        Si=rand(1);
        Ri=1;
        level=rand(1);
        r=randi(3,1)-1;

        ona=randi(2,1)-1;
        Aai=rand(1); % env osca
        Dai=1*rand(1);
        Sai=1*rand(1);
        levela=rand(1);
        ra=randi(3,1)-1;


        onb=randi(2,1)-1;
        Abi=rand(1); % env oscb
        Dbi=rand(1);
        Sbi=rand(1);

        levelb=rand(1);
        rb=randi(3,1)-1;


        onc=randi(2,1)-1;
        Aci=rand(1); % env oscc
        Dci=rand(1);
        Sci=rand(1);
        levelc=rand(1);
        rc=randi(3,1)-1;

        %--------------------------------------------------------------------------

        %envolventes del pitch
        onp=randi(2,1)-1;
        Api=rand(1); % env osca
        Dpi=rand(1);
        Spi=rand(1);
        levelp=rand(1);
        rp=randi(3,1)-1;
        pam=rand(1)*100; %pitchamount 0-100%;

        %--------------------------------------------------------------------------

        %fm=rand(1)*4950+50; %frecuencia de nota.
        EST=randi(6,1); %Estructura del synth ({1 2 3 4 5 6})

        Ia=rand(1)*40; %indice de modulacion osc A
        Ib=rand(1)*40; %indice de modulacion osc B
        Ic=rand(1)*40; %indice de modulacion osc C
        Idfm=rand(1)*40; %Indice de mod. para el caso DFM

        Ra=rand(1)*15; %Radio del osc A
        Rb=rand(1)*15; %Radio del osc B
        Rc=rand(1)*15; %Radio del osc C
        Rd=rand(1)*15; %Radio del osc D

        Radtype=randi(2,1)-1; %gen regulador que determina el tipo de radio, harmonico(1) o real(0).

        Rai=(randi(41,1)-1)/4; %Radio del osc A
        Rbi=(randi(41,1)-1)/4; %Radio del osc B
        Rci=(randi(41,1)-1)/4; %Radio del osc C
        Rdi=(randi(41,1)-1)/4; %Radio del osc D

        %--------------------------------------------------------------------------
        %par?metros del filtro

        filt_on=randi(2,1)-1; % 0 apagado, 1 encendido (gen regulador)
        fcorte=rand(1)*9920+80; %80hz - 18khz
        Qfac=rand(1)*9+1; %factor de calidad 1-10;

        onf=randi(2,1)-1; %parametros envolvente fc
        Afi=rand(1); 
        Dfi=rand(1);
        Sfi=rand(1);
        levelf=rand(1);
        rf=randi(3,1)-1;
        paf=rand(1)*100; %amount 0-100%;

        onq=randi(2,1)-1; %parametros envolvente Q
        Aqi=rand(1); % env osca
        Dqi=rand(1);
        Sqi=rand(1);
        levelq=rand(1);
        rq=randi(3,1)-1;



        %--------------------------------------------------------------------------

        %formas de onda

        osca= randi(4,1); % 1=sin ,2=square,3=triangle,4=sawtooth
        oscb= randi(4,1);
        oscc= randi(4,1);
        oscd= randi(4,1);

        %interruptores OSC (0 apagado 1 encendido)
        inta=randi(2,1)-1;
        intb=randi(2,1)-1;
        intc=randi(2,1)-1;

        %Aprox. 60 genes!!!!

        genoma(index,1:68)=[on Ai Di Si  level r ona Aai Dai Sai  levela ra onb Abi Dbi Sbi  levelb rb onc Aci Dci Sci  levelc rc onp Api Dpi Spi  levelp rp pam fm EST Ia Ib Ic Idfm Ra Rb Rc Rd Radtype Rai Rbi Rci Rdi osca oscb oscc oscd inta intb intc filt_on fcorte Qfac onf Afi Dfi Sfi levelf rf  onq Aqi Dqi Sqi levelq rq];
end
