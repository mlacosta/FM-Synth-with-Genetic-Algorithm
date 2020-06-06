function new_gen = cross_float (gen_1,gen_2,min,max)

%SBX crossover


r=rand(1);

if r<.5
    
    g=(2*r)^.5;
    
else
    
    g=(2*(1-r))^-.5;
 

end


r=rand(1);

if r>.5
    
    new_gen=0.5*[(1+g)*gen_1+(1-g)*gen_2];
    
else
    
    new_gen=0.5*[(1-g)*gen_1+(1+g)*gen_2];

end


while (new_gen<min | new_gen>max)
r=rand(1);

if r<.5
    
    g=(2*r)^.5;
    
else
    
    g=(2*(1-r))^-.5;
 

end

r=rand(1);

if r>.5
    
    new_gen=0.5*[(1+g)*gen_1+(1-g)*gen_2];
    
else
    
    new_gen=0.5*[(1-g)*gen_1+(1+g)*gen_2];

end
end
end
