%gerar gradientes
%para um mesmo vetor gradiente, a curva gerada será a mesma
quantidade = 10;
gradientes = (rand(1, quantidade) * 2) - 1; %valores aleatórios de -1 a 1

%gerar valores de ruido y para cada posição x a partir do vetor gradiente
y = [];
passo = 0.001;
for x=0:passo:quantidade-passo
    y(length(y) + 1, 1) = perlin_noise(gradientes, x);
end

plot(y);

%guarda o vetor gradiente em um arquivo
file = fopen("meus_gradientes.txt", "w+");
fprintf(file, "%d\n", gradientes);
fclose(file);

%le o vetor gradiente de um arquivo
file = fopen('meus_gradientes.txt', 'r');
gradientes = fscanf(file, "%f");
fclose(file);