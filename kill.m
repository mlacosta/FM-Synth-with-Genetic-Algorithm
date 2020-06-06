function new_generation = kill(genoma, hijos,kill_size)

[m n]=size(genoma);

%-------------------------------------------------------------------------
%Torneo
for j=1:8

for i=1:kill_size
index =randi(m,1);
torneo(i)=genoma(index,69);
end

kill(j)=max(torneo);

end


for i=1:8 %cant hijos
    
   for j=1:m
      if genoma(j,69)==kill(i)
          
          genoma (j,:)=hijos(i,:);
          break
      end
   end
   
   
end

new_generation=genoma;
end