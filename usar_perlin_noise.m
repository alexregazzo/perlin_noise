%gerar gradientes
quantidade = 10;
gradientes = (rand(1, quantidade) * 2) - 1; %valores aleatórios de -1 a 1

%gerar valores de ruido y para cada posição x
y = [];
passo = 0.001;
for x=0:passo:quantidade
    y(length(y) + 1) = perlin_noise(gradientes, x);
end
plot(y);



f = fopen("meus_gradientes.txt", "w+");
fprintf(f, "%d\n", gradientes);
fclose(f);