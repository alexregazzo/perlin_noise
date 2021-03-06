#include <stdio.h>
#include <math.h>

// define o vetor gradiente
float gradientes[] =
{
	4.229038e-01,
	7.682837e-02,
	4.917716e-02,
	4.479861e-03,
	-8.686550e-01,
	-5.399188e-01,
	-7.659194e-01,
	9.795421e-01,
	-8.589670e-01,
	-8.799527e-01
};
// tamanho do vetor gradiente
// AVISO: s� pode ser utilizado sizeof para vetores est�ticos
const int N = sizeof(gradientes) / sizeof(float);



float samplePerlin(float x)
{
	// fun��o que gera o perlin noise (na posi��o x) a partir da variavel global gradientes
	int lo = (int)x;
	int hi = lo + 1;
	float dist = x - lo;
	float loSlope = gradientes[lo % N];
	float hiSlope = gradientes[hi % N];
	float loPos = loSlope * dist;
	float hiPos = -hiSlope * (1.0f - dist);
	const float u = dist * dist * (3.0f - 2.0f * dist); // cubic curve
	return (loPos * (1.0f - u)) + (hiPos * u); // interpolate
}

int  main()
{
	// Imprimir o vetor gradiente
	// int i;
	// for (i = 0 ; i < N;i++){
	// 	printf("%f\n", gradientes[i]);
	// }

	// Colocar curva em arquivo de texto
	FILE *file;
	file = fopen("curve.txt", "w+");
	float x;
	for (x = 0 ; x < N; x += 0.001f)
	{
		fprintf(file, "%f\n", samplePerlin(x));
	}
	fclose(file);
	return 0;
}


