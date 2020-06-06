function genoma_c =control(genoma)

[m n]=size (genoma);

for i=1:m
    if isnan(genoma(i,69))==1
        genoma(i,69)=10^8;
    end
    
end

genoma_c=genoma;