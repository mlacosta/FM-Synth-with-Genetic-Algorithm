subplot(2,1,1)
plot(vaule)
subplot(2,1,1)
xlabel('Generación')
ylabel('Puntaje Mejor Individuo')
grid minor
xlim([0 639])
subplot(2,1,2)
for i=38:639
    if media(i)>(4*10^5)
        media(i)=3.85*10^5;
    end
end
plot(media)
subplot(2,1,2)
xlim([0 639])
xlabel('Generación')
ylabel('Puntaje Medio')
grid minor