function hijos = genetico (genoma,tam_torn,pm,fm)

[a,b]=size (genoma);

%-------------------------------------------------------------------------
%Torneo
for j=1:4

for i=1:tam_torn
index =randi(a,1);
g=genoma(index,:);
torneo(i,:)=g;
end

win=min(torneo(:,69));


for i=1:tam_torn

    if torneo(i,69)== win
       padre(j,:)=torneo(i,:) ;
    end
end

end

%-------------------------------------------------------------------------

%crossover+mutation

hijos=zeros(8,69);

%padre 1 con padre 2
k=1;
for i=1:4
    
   for j=1:68
       
       switch j
        case 1
            hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm); %interruptor
        case 2
            hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 3
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 4
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 5
            hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 6
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]);
        case 7
            hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 8
          hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 9
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 10
          hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 11
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 12
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]);
        case 13
            hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 14
          hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 15
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 16
         hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 17
          hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 18
         hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]);
        case 19
          hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 20
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 21
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 22
            hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 23
          hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 24
        hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]);
        case 25
           hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 26
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 27
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 28
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 29
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 30
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]); %discreto
        case 31
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,100),pm,0,100); %real
        case 32
          hijos(i,j)=fm;
        case 33
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[1 2 3 4 5 6]);
        case 34
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,40),pm,0,40);
        case 35
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,40),pm,0,40);
        case 36
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,40),pm,0,40);
        case 37
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,40),pm,0,40);
        case 38
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,15),pm,0,15);
        case 39
          hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,15),pm,0,15);
        case 40
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,15),pm,0,15);
        case 41
          hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,15),pm,0,15);
        case 42
           hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm); 
        case 43
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0:.25:10]);
        case 44
          hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0:.25:10]); 
        case 45
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0:.25:10]);
        case 46
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0:.25:10]);
        case 47
          hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[1 2 3 4]);
        case 48
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[1 2 3 4]);
        case 49
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[1 2 3 4]);
        case 50
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[1 2 3 4]);
        case 51
           hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 52
         hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 53
        hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 54
         hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 55
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),80,10000),pm,80,10000);
        case 56
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),1,10),pm,1,10);
        case 57
        hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 58
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 59
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 60
            hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 61
          hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 62
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]);
        case 63
         hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 64
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 65
         hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 66
         hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 67
         hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 68
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]);
    end
       
       
       
       
       
       
   end
   
end

%padre 3 con padre 4

k=3;
for i=5:8
    
   for j=1:68
       
       switch j
        case 1
            hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm); %interruptor
        case 2
            hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 3
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 4
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 5
            hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 6
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]);
        case 7
            hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 8
          hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 9
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 10
          hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 11
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 12
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]);
        case 13
            hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 14
          hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 15
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 16
         hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 17
          hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 18
         hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]);
        case 19
          hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 20
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 21
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 22
            hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 23
          hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 24
        hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]);
        case 25
           hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 26
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 27
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 28
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 29
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 30
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]); %discreto
        case 31
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,100),pm,0,100); %real
        case 32
          hijos(i,j)=fm;
        case 33
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[1 2 3 4 5 6]);
        case 34
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,40),pm,0,40);
        case 35
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,40),pm,0,40);
        case 36
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,40),pm,0,40);
        case 37
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,40),pm,0,40);
        case 38
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,15),pm,0,15);
        case 39
          hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,15),pm,0,15);
        case 40
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,15),pm,0,15);
        case 41
          hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),0,15),pm,0,15);
        case 42
           hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm); 
        case 43
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0:.25:10]);
        case 44
          hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0:.25:10]); 
        case 45
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0:.25:10]);
        case 46
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0:.25:10]);
        case 47
          hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[1 2 3 4]);
        case 48
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[1 2 3 4]);
        case 49
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[1 2 3 4]);
        case 50
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[1 2 3 4]);
        case 51
           hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 52
         hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 53
        hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 54
         hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 55
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),80,10000),pm,80,10000);
        case 56
           hijos(i,j)=mut_real(cross_float(padre(k,j),padre(k+1,j),1,10),pm,1,10);
        case 57
        hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 58
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 59
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 60
            hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 61
          hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 62
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]);
        case 63
         hijos(i,j)=mut_bin(cross_bin(padre(k,j),padre(k+1,j)),pm);
        case 64
           hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 65
         hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 66
         hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 67
         hijos(i,j)=mut_real(cross_float (padre(k,j),padre(k+1,j),0,1),pm,0,1);
        case 68
           hijos(i,j)= mut_disc(cross_bin(padre(k,j),padre(k+1,j)),pm,[0 1 2]);
    end
       
       
       
       
       
       
   end
   
end