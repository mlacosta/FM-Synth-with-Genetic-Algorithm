function new_generation = reemplazar(genoma, hijos)

[m n]=size(genoma);
rank=genoma(:,69);
rank=sort(rank,'descend')';

for i=1:8 %cant hijos
    
   for j=1:m
      if genoma(j,69)==rank(i)
          
          genoma (j,:)=hijos(i,:);
          break
      end
   end
   
   
end

new_generation=genoma;
end