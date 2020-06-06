function fit = fitness(S,target);

A=0.5; %balance del error

%norma espectral

[b,w]=size(S);


        norm=abs(S-target).^2;
 
        norm=sum(sum(norm));

%centroide

for i=1:w
 a=linspace(1,b,b).*S(:,w)';
 
 
cent_s(w)=sum(a)/sum(S(:,w)');

end

for i=1:w
 a=linspace(1,b,b).*target(:,w)';
cent_t(w)=sum(a)/sum(target(:,w)');

end

cdif=sum(abs(cent_t - cent_s));




fit= A*norm./w + (1-A)*cdif./w;

 if isnan(fit)==1
        fit=10^8;
    end
    

end