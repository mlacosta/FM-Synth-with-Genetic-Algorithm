function mutgen =mut_real (gen,pm,min,max)

if rand(1)<=pm
    
mutgen=rand(1)*(max-min)+min;
    
else
    
    mutgen=gen;

end

end