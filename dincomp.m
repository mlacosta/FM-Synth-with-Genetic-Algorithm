function y = dincomp(x)
%y = dincomp(x)
%Realiza la compresi�n del rango dinamico de ua imagen siguiendo la
%ecuaci�n 's=c*log10(1+abs(r))' , donde 'r' son los niveles fuera de rango de la
%im�gen original y 's'  los niveles de grises resultantes luego de haber aplicado la compresi�n;
%'c' se calcula en cada caso particular

%Determinaci�n de c
x=double(x);
c=255/(log10(1+abs(max(max(x)))));

%Mapeo de la matriz
[m,n]=size(x);
for i=1:m
    for j=1:n
        y(i,j)=round(c.*log10(1+abs(x(i,j))));
    end
end
y=uint8(y);