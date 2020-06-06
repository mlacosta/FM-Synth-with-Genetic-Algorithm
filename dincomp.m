function y = dincomp(x)
%y = dincomp(x)
%Realiza la compresión del rango dinamico de ua imagen siguiendo la
%ecuación 's=c*log10(1+abs(r))' , donde 'r' son los niveles fuera de rango de la
%imágen original y 's'  los niveles de grises resultantes luego de haber aplicado la compresión;
%'c' se calcula en cada caso particular

%Determinación de c
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