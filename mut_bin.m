function mutgen =mut_bin (gen,pm)

if rand(1)<=pm
    
   if gen==1
       mutgen=0;
   else
       mutgen=1;
       
   end
   
else
    
    mutgen=gen;

end

end