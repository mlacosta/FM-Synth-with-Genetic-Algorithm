function mutgen =mut_disc (gen,pm,posible)
%posible=vector que contiene los posibles valores del gen

l=length(posible);

 mutgen =gen;

if rand(1)<=pm
    
    while mutgen==gen
    mutgen=posible(randi(l,1));
    end
    
end

   end

